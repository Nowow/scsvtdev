#include "vec3.h"
#include "actor.h"

#include <Windows.h>
#include "detours.h"

#include <fstream>
#include <string>

namespace cfg
{
	float Forward_Speed  =  5.1f;
	float Falling_Speed  =  1.5f;
	float LiftUp_Speed   = 10.0f;
	float LiftDown_Speed =  1.0f;
};

bool enable_physics = true;
vec3 velocity;

struct move_params
{
	float delta;
private:
	char padding[0xC];
public:
	vec3 input;
};

using move_t = void(__thiscall*)(actor::physics_data*, move_params*);
move_t orig_move;

float fJumpHeightMin;
bool isFlyingActive;
bool isFlyingUp;
bool isFlyingDown;

// Override the original Skyrim physics
void __fastcall hook_move(actor::physics_data *phys_data, const int edx, move_params *params)
{
	if(!enable_physics)
		return orig_move(phys_data, params);


	// Read Skyrim engine variable "fJumpHeightMin"
	memcpy(&fJumpHeightMin, (void *)0x01B16218, 4);

	isFlyingActive = isFlyingUp = isFlyingDown = false;

	if ((fJumpHeightMin > 349.0f) && (fJumpHeightMin < 451.0f))	isFlyingActive	= true;
	if ((fJumpHeightMin > 449.0f) && (fJumpHeightMin < 451.0f))	isFlyingUp		= true;
	if ((fJumpHeightMin > 349.0f) && (fJumpHeightMin < 351.0f))	isFlyingDown	= true;


	// If Character is Falling but HAS wings:
	if ((phys_data->velocity().z < 0) && (isFlyingActive == true))
	{
		velocity.y = velocity.y * cfg::Forward_Speed;
		velocity.x = velocity.x * cfg::Forward_Speed;
		params->input.x = params->input.x * cfg::Forward_Speed;
		params->input.y = params->input.y * cfg::Forward_Speed;

		velocity.z = phys_data->velocity().z / cfg::Falling_Speed ;

		if (isFlyingUp == true)
		{
			//params->input.x = params->input.x * cfg::Forward_Speed / 2.0f;
			//params->input.y = params->input.y * cfg::Forward_Speed / 2.0f;
			velocity.z = velocity.z + cfg::LiftUp_Speed;
		}
		if (isFlyingDown == true) velocity.z = velocity.z - cfg::LiftDown_Speed;

		phys_data->set_velocity(velocity);
	}

	return orig_move(phys_data, params);
}

using change_cam_t = void(__thiscall*)(uintptr_t, uintptr_t);
change_cam_t orig_change_cam;

// Disable physics during the "VATS" (killcam) camera
void __fastcall hook_change_cam(uintptr_t camera, const int edx, uintptr_t new_state)
{
	auto cam_id = *(int*)(new_state + 0xC);

	enable_physics = cam_id != 2;
	orig_change_cam(camera, new_state);
}

struct PluginInfo
{
	unsigned int infoVersion;
	const char *name;
	unsigned int version;
};

extern "C" __declspec(dllexport) bool SKSEPlugin_Query(void *skse, PluginInfo *info)
{
	info->infoVersion = 3;
	info->version = 3;
	info->name = "Player Flying Physics";

	return true;
}

// Read the config file
void read_cfg()
{
	std::ifstream config("Data/SKSE/Plugins/Flying_Physics.cfg");
	if(config.fail())
		return;

	while(!config.eof()) {
		std::string line;
		std::getline(config, line);

		char key[32];
		float value;
		if(sscanf_s(line.c_str(), "%s %f", key, 32, &value) != 2)
			continue;

		if(strncmp(key, "//", 2) == 0)
			continue;

		else if (strcmp(key, "Forward_Speed") == 0)
			cfg::Forward_Speed = value;
		else if (strcmp(key, "Falling_Speed") == 0)
			cfg::Falling_Speed = value;
		else if (strcmp(key, "LiftUp_Speed") == 0)
			cfg::LiftUp_Speed = value;
		else if (strcmp(key, "LiftDown_Speed") == 0)
			cfg::LiftDown_Speed = value;
		
	}
}

// Detour move and camera state change functions
extern "C" __declspec(dllexport) bool SKSEPlugin_Load(void *skse)
{
	read_cfg();
	orig_move = (move_t)(DetourFunction((byte*)(0xD1DA60), (byte*)(hook_move)));
	orig_change_cam = (change_cam_t)(DetourFunction((byte*)(0x6533D0), (byte*)(hook_change_cam)));
	return true;
}