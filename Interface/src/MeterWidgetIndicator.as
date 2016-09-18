import skyui.widgets.WidgetBase;
import skyui.components.Meter;
import Shared.GlobalFunc;

class skyui.widgets.meter.MeterWidgetIndicator extends WidgetBase
{
  /* PRIVATE VARIABLES */

	private var _initialized: Boolean = false;
	private var __width;
	private var __height;

	/* FROSTFALL PRIVATE VARIABLES */

	private var _meterIndicator: MovieClip;
	private var _indInitialized: Boolean;
	private var _indCurrentPercent: Number;
	private var _indTargetPercent: Number;
	private var _indFillDelta: Number = 0.03;
	private var _indEmptyDelta: Number = 0.03;
	private var _indEmpty: Number;
	private var _indFull: Number;


  /* STAGE ELEMENTS */

	public var meter: Meter;


  /* INITIALIZATION */

	public function MeterWidget()
	{
		super();
		meter._visible = false;
	}

	// @papyrus
	public function initNumbers(a_width: Number, a_height: Number, a_lightColor: Number, a_darkColor: Number, a_flashColor: Number,
								a_percent: Number, a_fillSpeed: Number, a_emptySpeed: Number): Void
	{
		setSize(a_width, a_height);
		setColors(a_lightColor, a_darkColor);
		setFlashColor(a_flashColor);
		setPercent(a_percent, true);
		//a_fillSpeed;
		//a_emptySpeed;
	}


	// @papyrus
	public function initStrings(a_fillDirection: String): Void
	{
		meter.setFillDirection(a_fillDirection, true); //Reset fill Direction and force percentage back
	}

	// @papyrus
	public function initCommit(): Void
	{
		meter._visible = true;
		_initialized = true;
	}

	// @papyrus
	public function setWidth(a_width: Number): Void
	{
		meter.width = a_width;
		__width = meter.width;
		invalidateSize();
		_indInitialized = false;
	}

	// @papyrus
	public function setHeight(a_height: Number): Void
	{
		meter.height = a_height;
		__height = meter.height;
		invalidateSize();
		_indInitialized = false;
	}

	// @papyrus
	public function setSize(a_width: Number, a_height: Number): Void
	{
		meter.setSize(a_width, a_height);
		__width = meter.width;
		__height = meter.height;
		invalidateSize();
		_indInitialized = false;
	}

	// @papyrus
	public function setColor(a_lightColor: Number): Void
	{
		meter.color = a_lightColor;
	}

	// @papyrus
	public function setColors(a_lightColor: Number, a_darkColor: Number, a_flashColor: Number): Void
	{
		meter.setColors(a_lightColor, a_darkColor);
	}

	// @papyrus
	public function setFlashColor(a_flashColor: Number): Void
	{
		meter.flashColor = a_flashColor;
	}

	// @papyrus
	public function setFillDirection(a_fillDirection: String): Void
	{
		meter.fillDirection = a_fillDirection;
		_indInitialized = false;
		initializeIndicator();
	}

	// @papyrus
	public function setPercent(a_percent: Number, a_force: Boolean): Void
	{
		meter.setPercent(a_percent, a_force);
	}

	// @papyrus
	public function setIndicatorPercent(a_percent: Number, a_force: Boolean): Void
	{
		//skse.Log("setIndicatorPercent setting " + a_percent.toString());
		initializeIndicator();
		_indTargetPercent = Math.min(1, Math.max(a_percent, 0));

		if (a_force) {
			_indCurrentPercent = _indTargetPercent;
			var iMeterFrame: Number = Math.floor(GlobalFunc.Lerp(_indEmpty, _indFull, 0, 1, _indCurrentPercent));
			_meterIndicator.gotoAndStop(iMeterFrame);
		}
	}

	private function initializeIndicator(): Void
	{
		// Frostfall - Ran into issues with the indicator movieclip being available
		// on initCommit, so, check for this here and set values if not
		// initialized.

		if (!_indInitialized) {
			_meterIndicator = meter.meterContent.meterFillHolder.meterFillContent.meterIndicator;
			if (_meterIndicator) {
				_meterIndicator.gotoAndStop("FullIndicator");
				_indFull = _meterIndicator._currentframe;
				_meterIndicator.gotoAndStop("EmptyIndicator");
				_indEmpty = _meterIndicator._currentframe;
				_indInitialized = true;
				skse.Log(this + " (meter with indicator) initialized.")
				onEnterFrame = indicatorEnterFrameHandler;
				//skse.Log("Full is " + _indFull.toString());
				//skse.Log("Empty is " + _indEmpty.toString());
			}
			else
			{
				skse.Log(this + " Initialization error: the indicator movie clip is not available yet.")
			}
		}
	}

	private function indicatorEnterFrameHandler(): Void
	{
		if (_indTargetPercent == _indCurrentPercent) {
			return;
		}

		if (_indCurrentPercent < _indTargetPercent) {
			_indCurrentPercent = _indCurrentPercent + _indFillDelta;
			if (_indCurrentPercent > _indTargetPercent)
				_indCurrentPercent = _indTargetPercent;
		} else {
			_indCurrentPercent = _indCurrentPercent - _indEmptyDelta;
			if (_indCurrentPercent < _indTargetPercent)
				_indCurrentPercent = _indTargetPercent;
		}

		_indCurrentPercent = Math.min(1, Math.max(_indCurrentPercent, 0));
		var iMeterFrame: Number = Math.floor(GlobalFunc.Lerp(_indEmpty, _indFull, 0, 1, _indCurrentPercent));
		_meterIndicator.gotoAndStop(iMeterFrame);
	}

	// @papyrus
	public function startFlash(a_force: Boolean): Void
	{
		meter.startFlash(a_force);
	}


  /* PRIVATE FUNCTIONS */

	// @Overrides WidgetBase
	private function getWidth(): Number
	{
		return __width;
	}
	// @Overrides WidgetBase
	private function getHeight(): Number
	{
		return __height;
	}
}
