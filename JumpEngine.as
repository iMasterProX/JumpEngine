import flash.events.KeyboardEvent;
import flash.events.Event;
//이 위는 정의 과정에서 자동으로 생성됨


var Li = false;
var Ri = false;
var Si = false;
//방향키, 스페이스 변수

var St = true;
//중력 관련 변수

var G1 = 1;
var G2 = 0;
//G1:중력 변수 G2:중력 가속도 변수

stage.addEventListener(KeyboardEvent.KEY_DOWN,keydown);
function keydown(e:KeyboardEvent)
{
	if(e.keyCode == 37)
	{
		Li = true;
		Mover.gotoAndStop(2);
	}
	if(e.keyCode == 39)
	{
		Ri = true;
		Mover.gotoAndStop(1);
	}
	if(e.keyCode == 32)
	{
		Si = true;
	}
}

stage.addEventListener(KeyboardEvent.KEY_UP,keyup);
function keyup(e:KeyboardEvent)
{
	if(e.keyCode == 37)
	{
		Li = false;
	}
	if(e.keyCode == 39)
	{
		Ri = false;
	}
	/*if(e.keyCode == 32)
	{
		Si = false;
	}*/
}

stage.addEventListener(Event.ENTER_FRAME,moveandgrav);
function moveandgrav(e:Event)
{
	if(Li == true)
	{
		block.x += 5;
	}
	if(Ri == true)
	{
		block.x -= 5;
	}
	if(Si == true)
	{
		Mover.y -= 14;
	}
	if(St == true)
	{
		G2 += G1;
		Mover.y += G2;
	}
}

stage.addEventListener(Event.ENTER_FRAME,blcoka);
function blcoka(e:Event)
{
	if(block.hitTestPoint(Mover.x,Mover.y,true) == true)
	{
		G1 -= 1.5;
		G2 = 0
		Si = false;
	}
	if(block.hitTestPoint(Mover.x,Mover.y,true) == false)
	{
		G1 = 1;
    }
}