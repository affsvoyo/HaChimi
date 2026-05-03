package;

import openfl.display.Sprite;
import flixel.FlxGame;

class Main extends Sprite
{
    public function new()
    {
        super();
        addChild(new FlxGame(800, 800, PlayState));
    }
}
