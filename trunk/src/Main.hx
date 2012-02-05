package ;


    import neko.Lib;

/**
 * ...
 * @author Igor Kerogi Kostenko
 */

class Main 
{
	static var mattr_size:Int = 5;
	static var mattr:Array<Float> = new Array<Float>();

	static function fill_func(i:Int, j:Int):Float
	{
		return Math.pow(2, j - 1) * (Math.abs(j - 3) - 1.3) * Math.pow(2, j) * (i - 3.4) * (j / 3 - 1);
	}
	
	static function fill_mattrix(mattr_array:Array<Float>, size:Int, func:Int->Int->Float):Void
	{
		for (i in 0...size)
		{
			for (j in 0...size)
			{
				mattr.push(func(i+1, j+1));
			}
		}
	}
	
	static function print_matrix(mattr_array:Array<Float>, size:Int, div:String = ', ', lastdiv:Bool = false ):Void
	{
		for (i in 0...size)
		{
			for (j in 0...size)
			{
				Lib.print(mattr[i * size + j]);
				if (lastdiv || j < size-1) Lib.print(div);
			}
			Lib.print('\n');
		}
	}
	
	static function transpose_mattrix(mattr_array:Array<Float>, size:Int):Void
	{
		for (i in 0...size)
		{
			for (j in 0...(size-1))
			{
				for (k in j...(size-1))
				{
					var a:Float = mattr[i * size + k];
					var b:Float = mattr[i * size + k + 1];
					if ( a < 0 && b >=0)
					{
						mattr[i * size + k] = b;
						mattr[i * size + k + 1] = a;
					}
				}
			}
		}
	}
	
	static function main() 
	{
		Lib.print("Filling matrix\n");
		fill_mattrix(mattr, 5, fill_func );
		Lib.print("\nPrinting matrix\n");
		print_matrix(mattr, mattr_size, '\t');
		Lib.print("\nTransforming matrix\n");
		transpose_mattrix(mattr, mattr_size);
		Lib.print("\nPrinting matrix\n");	
		print_matrix(mattr, mattr_size, '\t');
	}
	
}