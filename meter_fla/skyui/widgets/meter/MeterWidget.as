class skyui.widgets.meter.MeterWidget extends skyui.widgets.WidgetBase
{
    var meter, __width, invalidateSize, __height;
    function MeterWidget()
    {
        super();
        meter._visible = false;
    } // End of the function
    function initNumbers(a_width, a_height, a_lightColor, a_darkColor, a_flashColor, a_percent, a_fillSpeed, a_emptySpeed)
    {
        this.setSize(a_width, a_height);
        this.setColors(a_lightColor, a_darkColor);
        this.setFlashColor(a_flashColor);
        this.setPercent(a_percent, true);
    } // End of the function
    function initStrings(a_fillDirection)
    {
        meter.setFillDirection(a_fillDirection, true);
    } // End of the function
    function initCommit()
    {
        meter._visible = true;
        _initialized = true;
    } // End of the function
    function setWidth(a_width)
    {
        meter.__set__width(a_width);
        __width = meter.width;
        this.invalidateSize();
    } // End of the function
    function setHeight(a_height)
    {
        meter.__set__height(a_height);
        __height = meter.height;
        this.invalidateSize();
    } // End of the function
    function setSize(a_width, a_height)
    {
        meter.setSize(a_width, a_height);
        __width = meter.width;
        __height = meter.height;
        this.invalidateSize();
    } // End of the function
    function setColor(a_lightColor)
    {
        meter.__set__color(a_lightColor);
    } // End of the function
    function setColors(a_lightColor, a_darkColor, a_flashColor)
    {
        meter.setColors(a_lightColor, a_darkColor);
    } // End of the function
    function setFlashColor(a_flashColor)
    {
        meter.__set__flashColor(a_flashColor);
    } // End of the function
    function setFillDirection(a_fillDirection)
    {
        meter.__set__fillDirection(a_fillDirection);
    } // End of the function
    function setPercent(a_percent, a_force)
    {
        meter.setPercent(a_percent, a_force);
    } // End of the function
    function startFlash(a_force)
    {
        meter.startFlash(a_force);
    } // End of the function
    function getWidth()
    {
        return (__width);
    } // End of the function
    function getHeight()
    {
        return (__height);
    } // End of the function
    var _initialized = false;
} // End of Class
