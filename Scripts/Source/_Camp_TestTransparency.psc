Scriptname _Camp_TestTransparency extends ObjectReference  

EffectShader property MyShader auto
ObjectReference property MyRef auto

Event OnInit()
	MyShader.Play(MyRef)
endEvent