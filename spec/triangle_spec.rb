require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do

  context "異常値入力"  do

    it "辺の長さが全て0" do
      expect(Triangle.check_triangle_shape( 0, 0, 0 )).to eq Triangle::MESSAGE_NOT_TRIANGLE
    end

    it "辺の長さaが0" do
      expect(Triangle.check_triangle_shape( 0, 1, 1 )).to eq Triangle::MESSAGE_NOT_TRIANGLE
    end

    it "辺の長さbが0" do
      expect(Triangle.check_triangle_shape( 1, 0, 1 )).to eq Triangle::MESSAGE_NOT_TRIANGLE
    end

    it "辺の長さcが0" do
      expect(Triangle.check_triangle_shape( 1, 1, 0 )).to eq Triangle::MESSAGE_NOT_TRIANGLE
    end

    it "辺の長さが全てマイナス" do
      expect(Triangle.check_triangle_shape( -1, -1, -1 )).to eq Triangle::MESSAGE_NOT_TRIANGLE
    end

    it "辺の長さにマイナスが含まれる" do
      expect(Triangle.check_triangle_shape( 1, 1, -1 )).to eq Triangle::MESSAGE_NOT_TRIANGLE
    end

  end

  context "三角形が作れない"  do

    it "三角形が作れない" do
      expect(Triangle.check_triangle_shape( 1, 2, 3 )).to eq Triangle::MESSAGE_NOT_TRIANGLE
    end

    it "三角形が作れる場合は、異なったメッセージ" do
      expect(Triangle.check_triangle_shape( 2, 2, 3 )).not_to eq Triangle::MESSAGE_NOT_TRIANGLE
    end


  end


  context "正三角形"  do

    it "辺の長さが1" do
      expect(Triangle.check_triangle_shape( 1, 1, 1 )).to eq Triangle::MESSAGE_EQUILATERAL_TRIANGLE
    end

    it "辺の長さが1以外" do
      expect(Triangle.check_triangle_shape( 3, 3, 3 )).to eq Triangle::MESSAGE_EQUILATERAL_TRIANGLE
    end

    it "正三角形ではない" do
      expect(Triangle.check_triangle_shape( 1, 1, 2 )).not_to eq Triangle::MESSAGE_EQUILATERAL_TRIANGLE
    end

  end

  context "直角三角形"  do

    it "整数最小値での辺の長さ" do
      expect(Triangle.check_triangle_shape( 3, 4, 5 )).to eq Triangle::MESSAGE_RIGHT_TRIANGLE
    end

    it "整数最小値での辺の長さ、順不同" do
      expect(Triangle.check_triangle_shape( 3, 5, 4 )).to eq Triangle::MESSAGE_RIGHT_TRIANGLE
    end

    it "最小ではない辺の長さ" do
      expect(Triangle.check_triangle_shape( 6, 8, 10 )).to eq Triangle::MESSAGE_RIGHT_TRIANGLE
    end

    it "直角三角形ではない" do
      expect(Triangle.check_triangle_shape( 8, 8, 3 )).not_to eq Triangle::MESSAGE_RIGHT_TRIANGLE
    end

  end

  context "二等辺三角形"  do

    it "整数最小値での辺の長さ" do
      expect(Triangle.check_triangle_shape( 2, 2, 1 )).to eq Triangle::MESSAGE_ISOSCELES_TRIANGLE
    end

    it "整数最小値での辺の長さ、順不同" do
      expect(Triangle.check_triangle_shape( 1, 2, 2 )).to eq Triangle::MESSAGE_ISOSCELES_TRIANGLE
    end

    it "最小ではない辺の長さ" do
      expect(Triangle.check_triangle_shape( 3, 3, 2 )).to eq Triangle::MESSAGE_ISOSCELES_TRIANGLE
    end

    it "二等辺三角形ではない" do
      expect(Triangle.check_triangle_shape( 3, 3, 3 )).not_to eq Triangle::MESSAGE_ISOSCELES_TRIANGLE
    end

  end

  context "不等辺三角形"  do

    it "整数での辺の長さ" do
      expect(Triangle.check_triangle_shape( 2, 3, 4 )).to eq Triangle::MESSAGE_SCALENE_TRIANGLE
    end

    it "整数での辺の長さ、順不同" do
      expect(Triangle.check_triangle_shape( 4, 2, 3 )).to eq Triangle::MESSAGE_SCALENE_TRIANGLE
    end

    it "不等辺三角形ではない" do
      expect(Triangle.check_triangle_shape( 2, 2, 1 )).not_to eq Triangle::MESSAGE_SCALENE_TRIANGLE
    end

  end

end