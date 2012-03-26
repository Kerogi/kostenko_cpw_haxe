package ;

#if neko
    import neko.Lib;
#elseif cpp
	import cpp.Lib;
#end	

/**
 * ...
 * @author Igor Kerogi Kostenko
 */

class Main 
{
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
				mattr_array.push(func(i+1, j+1));
			}
		}
	}
	
	static function print_matrix(mattr_array:Array<Float>, size:Int, div:String = ', ', lastdiv:Bool = false ):Void
	{
		for (i in 0...size)
		{
			for (j in 0...size)
			{
				Lib.print(mattr_array[i * size + j]);
				if (lastdiv || j < size-1) Lib.print(div);
			}
			Lib.print('\n');
		}
	}
	
	static function transform_mattrix(mattr_array:Array<Float>, size:Int):Void
	{
		for (i in 0...size)
		{
			for (j in 0...(size-1))
			{
				for (k in j...(size-1))
				{
					var a:Float = mattr_array[i * size + k];
					var b:Float = mattr_array[i * size + k + 1];
					if ( a < 0 && b >=0)
					{
						mattr_array[i * size + k] = b;
						mattr_array[i * size + k + 1] = a;
					}
				}
			}
		}
	}
	
		
	static function find_vector_X(mattr_array:Array<Float>, size:Int):Array<Float>
	{
		var vectorX:Array<Float> = new Array<Float>();
		for (i in 0...size)
		{
			for (j in 0...size)
			{
				var res:Float = 0;
				for (k in 0...size)
				{
					res = res + (mattr_array[k * size + j] * mattr_array[i * size + k]); 
				}
				vectorX.push(res);
			}
		}
		return vectorX;
	}
	
	static function calculate_sum(vector:Array<Float>):Float
	{
		var l:Int = vector.length;
		var res:Float = 0;
		for (i in 0...l)
		{
			res += vector[i] + vector[l - i -1];
		}
		return res;
	}
	
	static function main() 
	{
		var A_size:Int = 5;
		var A:Array<Float> = new Array<Float>();
		var X:Array<Float> = new Array<Float>();
		var U:Float = 0;

		Lib.println("Filling matrix");
		fill_mattrix(A, A_size, fill_func );
		Lib.println("Matrix 'A':");
		print_matrix(A, A_size, '\t');
		
		Lib.println("\nTransforming matrix");
		transform_mattrix(A, A_size);
		Lib.println("Matrix 'A\'':");
		print_matrix(A, A_size, '\t');
		
		Lib.println("\nCalculating X vector");
		X = find_vector_X(A, A_size);
		Lib.println("Vector 'X':"+X);
		
		
		Lib.println("\nCalculating sum");
		U = calculate_sum(X);
		Lib.println("Sum 'U':"+U);		
	}
	
}