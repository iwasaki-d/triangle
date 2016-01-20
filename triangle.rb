class Triangle

  MESSAGE_NOT_TRIANGLE = "三角形じゃないです！"
  MESSAGE_EQUILATERAL_TRIANGLE = "正三角形です"
  MESSAGE_RIGHT_TRIANGLE = "直角三角形です"
  MESSAGE_ISOSCELES_TRIANGLE = "二等辺三角形です"
  MESSAGE_SCALENE_TRIANGLE = "不等辺三角形です"

  def self.triangle?(a:0, b:0, c:0)

    if ! ( a < b + c )
      return false
    end

    if ! ( b < a + c )
      return false
    end

    if ! ( c < a + b )
      return false
    end

    #3角不等式を全て満たせば、三角形を作る事ができる。
    return true

  end

  #3つの辺を長さ順に整理する
  def self.sort_length(a:0, b:0, c:0)

    length_array = [a,b,c]

    length_array.sort!

    return { short_length:length_array[0], middle_length:length_array[1], long_length:length_array[2] }

  end

  #直角三角形であるか判定
  def self.right_triangle?(long_length:0, middle_length:0, short_length:0)

    if long_length ** 2 == middle_length ** 2 + short_length ** 2
      return true
    end

    return false

  end

  #不等辺三角形であるか判定
  #def self.scalene_triangle?(long_length : 0, middle_length : 0, short_length : 0)
  #end

  #二等辺三角形であるか判定
  def self.isosceles_triangle?(long_length:0, middle_length:0)

    if long_length == middle_length
      return true
    end

    return false

  end

  #正三角形であるか判定
  def self.equilateral_triangle?(long_length:0, middle_length:0, short_length:0 )

    if long_length == middle_length && middle_length == short_length
      return true
    end

    return false

  end

  def self.check_triangle_shape( arg_a, arg_b, arg_c )

    if ! triangle?( a:arg_a, b:arg_b, c:arg_c )
      return MESSAGE_NOT_TRIANGLE
    end

    length_hash = sort_length( a:arg_a, b:arg_b, c:arg_c )

    if equilateral_triangle?(length_hash)
      return MESSAGE_EQUILATERAL_TRIANGLE
    end

    if right_triangle?(length_hash)
      return MESSAGE_RIGHT_TRIANGLE
    end

    if isosceles_triangle?( long_length:length_hash[:long_length], middle_length:length_hash[:middle_length])
      return MESSAGE_ISOSCELES_TRIANGLE
    end

    #三角系であり、今までの判定に該当しなかった場合は、不等辺三角形
    return MESSAGE_SCALENE_TRIANGLE

  end

end
