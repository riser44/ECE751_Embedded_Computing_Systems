// bayer_center_pixel =
			    // 0 = Blue
			    // 1 = Green in blue row (in BGGR, the first green)
			    // 2 = Green in red row (in BGGR, the second green)
			    // 3 = Red
module dut_tb();
    logic [7:0] pixel_window [0:4] [0:4];
    logic pixel_row_en [0:4] = '{default: 1'b1};
    logic pixel_col_en [0:4] = '{default: 1'b1};
    logic [1:0] bayer_center_pixel;
    logic [23:0] final_rgb_pixel;
    demosaicing u_demosaicing(.pixel_window(pixel_window), .pixel_row_en(pixel_row_en), .pixel_col_en(pixel_col_en), .bayer_center_pixel(bayer_center_pixel), .final_rgb_pixel(final_rgb_pixel));
    initial
    begin

//Jagdish Mohapatra - Row number 6-10
#5;
//1st 
	pixel_window[0][0] = 35;
	pixel_window[0][1] = 35;
	pixel_window[0][2] = 38;
	pixel_window[0][3] = 41;
	pixel_window[0][4] = 41;

	pixel_window[1][0] = 36;
	pixel_window[1][1] = 33;
	pixel_window[1][2] = 27;
	pixel_window[1][3] = 39;
	pixel_window[1][4] = 36;

	pixel_window[2][0] = 33;
	pixel_window[2][1] = 33;
	pixel_window[2][2] = 38;
	pixel_window[2][3] = 39;
	pixel_window[2][4] = 40;

	pixel_window[3][0] = 25;
	pixel_window[3][1] = 38;
	pixel_window[3][2] = 25;
	pixel_window[3][3] = 39;
	pixel_window[3][4] = 41;

	pixel_window[4][0] = 32;
	pixel_window[4][1] = 35;
	pixel_window[4][2] = 36;
	pixel_window[4][3] = 39;
	pixel_window[4][4] = 37;

	bayer_center_pixel = 2'b10;
        #1;
	$display("Expected R G B: 36	38    26");
	$display("1> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=36 G=38 B=26 
#5;
//2nd

	pixel_window[0][0] = 35;
	pixel_window[0][1] = 38;
	pixel_window[0][2] = 41;
	pixel_window[0][3] = 41;
	pixel_window[0][4] = 42;

	pixel_window[1][0] = 33;
	pixel_window[1][1] = 27;
	pixel_window[1][2] = 39;
	pixel_window[1][3] = 36;
	pixel_window[1][4] = 40;

	pixel_window[2][0] = 33;
	pixel_window[2][1] = 38;
	pixel_window[2][2] = 39;
	pixel_window[2][3] = 40;
	pixel_window[2][4] = 43;

	pixel_window[3][0] = 38;
	pixel_window[3][1] = 25;
	pixel_window[3][2] = 39;
	pixel_window[3][3] = 41;
	pixel_window[3][4] = 42;

	pixel_window[4][0] = 35;
	pixel_window[4][1] = 36;
	pixel_window[4][2] = 39;
	pixel_window[4][3] = 37;
	pixel_window[4][4] = 39;

	bayer_center_pixel = 2'b11;
        #1;
	$display("Expected R G B: 39	39	32");
	$display("2> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=39 G=39 B=32 

#5;
//3rd

	pixel_window[0][0] = 38;
	pixel_window[0][1] = 41;
	pixel_window[0][2] = 41;
	pixel_window[0][3] = 42;
	pixel_window[0][4] = 38;

	pixel_window[1][0] = 27;
	pixel_window[1][1] = 39;
	pixel_window[1][2] = 36;
	pixel_window[1][3] = 40;
	pixel_window[1][4] = 39;

	pixel_window[2][0] = 38;
	pixel_window[2][1] = 39;
	pixel_window[2][2] = 40;
	pixel_window[2][3] = 43;
	pixel_window[2][4] = 38;

	pixel_window[3][0] = 25;
	pixel_window[3][1] = 39;
	pixel_window[3][2] = 41;
	pixel_window[3][3] = 42;
	pixel_window[3][4] = 46;

	pixel_window[4][0] = 36;
	pixel_window[4][1] = 39;
	pixel_window[4][2] = 37;
	pixel_window[4][3] = 39;
	pixel_window[4][4] = 38;

	bayer_center_pixel = 2'b10;
        #1;
	$display("Expected R G B: 41	40	38");
	$display("3> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=41 G=40 B=38 

#5;
//4th

	pixel_window[0][0] = 41;
	pixel_window[0][1] = 41;
	pixel_window[0][2] = 42;
	pixel_window[0][3] = 38;
	pixel_window[0][4] = 39;

	pixel_window[1][0] = 39;
	pixel_window[1][1] = 36;
	pixel_window[1][2] = 40;
	pixel_window[1][3] = 39;
	pixel_window[1][4] = 38;

	pixel_window[2][0] = 39;
	pixel_window[2][1] = 40;
	pixel_window[2][2] = 43;
	pixel_window[2][3] = 38;
	pixel_window[2][4] = 38;

	pixel_window[3][0] = 39;
	pixel_window[3][1] = 41;
	pixel_window[3][2] = 42;
	pixel_window[3][3] = 46;
	pixel_window[3][4] = 42;

	pixel_window[4][0] = 39;
	pixel_window[4][1] = 37;
	pixel_window[4][2] = 39;
	pixel_window[4][3] = 38;
	pixel_window[4][4] = 41;

	bayer_center_pixel = 2'b11;
        #1;
	$display("Expected R G B: 43,	41,	43");
	$display("4> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=43 G=41 B=43 


#5;
//5th
	pixel_window[0][0] = 41;
	pixel_window[0][1] = 42;
	pixel_window[0][2] = 38;
	pixel_window[0][3] = 39;
	pixel_window[0][4] = 38;

	pixel_window[1][0] = 36;
	pixel_window[1][1] = 40;
	pixel_window[1][2] = 39;
	pixel_window[1][3] = 38;
	pixel_window[1][4] = 38;

	pixel_window[2][0] = 40;
	pixel_window[2][1] = 43;
	pixel_window[2][2] = 38;
	pixel_window[2][3] = 38;
	pixel_window[2][4] = 38;

	pixel_window[3][0] = 41;
	pixel_window[3][1] = 42;
	pixel_window[3][2] = 46;
	pixel_window[3][3] = 42;
	pixel_window[3][4] = 33;

	pixel_window[4][0] = 37;
	pixel_window[4][1] = 39;
	pixel_window[4][2] = 38;
	pixel_window[4][3] = 41;
	pixel_window[4][4] = 38;

	bayer_center_pixel = 2'b10;
        #1;
	$display("Expected R G B: 39	38	41");
	$display("5> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=39 G=38 B=41

#5
//6th

	pixel_window[0][0] = 42;
	pixel_window[0][1] = 38;
	pixel_window[0][2] = 39;
	pixel_window[0][3] = 38;
	pixel_window[0][4] = 39;

	pixel_window[1][0] = 40;
	pixel_window[1][1] = 39;
	pixel_window[1][2] = 38;
	pixel_window[1][3] = 36;
	pixel_window[1][4] = 39;

	pixel_window[2][0] = 43;
	pixel_window[2][1] = 38;
	pixel_window[2][2] = 38;
	pixel_window[2][3] = 38;
	pixel_window[2][4] = 39;

	pixel_window[3][0] = 42;
	pixel_window[3][1] = 41;
	pixel_window[3][2] = 42;
	pixel_window[3][3] = 33;
	pixel_window[3][4] = 40;

	pixel_window[4][0] = 39;
	pixel_window[4][1] = 38;
	pixel_window[4][2] = 41;
	pixel_window[4][3] = 38;
	pixel_window[4][4] = 41;

	bayer_center_pixel = 2'b11;
        #1;
	$display("Expected R G B:38	37	35");
	$display("6> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=38 G=37 B=36

#5
//7th

	pixel_window[0][0] = 38;
	pixel_window[0][1] = 39;
	pixel_window[0][2] = 38;
	pixel_window[0][3] = 39;
	pixel_window[0][4] = 38;

	pixel_window[1][0] = 39;
	pixel_window[1][1] = 38;
	pixel_window[1][2] = 36;
	pixel_window[1][3] = 39;
	pixel_window[1][4] = 39;

	pixel_window[2][0] = 38;
	pixel_window[2][1] = 38;
	pixel_window[2][2] = 38;
	pixel_window[2][3] = 39;
	pixel_window[2][4] = 38;

	pixel_window[3][0] = 46;
	pixel_window[3][1] = 42;
	pixel_window[3][2] = 33;
	pixel_window[3][3] = 40;
	pixel_window[3][4] = 27;

	pixel_window[4][0] = 38;
	pixel_window[4][1] = 41;
	pixel_window[4][2] = 38;
	pixel_window[4][3] = 41;
	pixel_window[4][4] = 39;

	bayer_center_pixel = 2'b10;
        #1;
	$display("Expected R G B: 37	38	33");
	$display("7> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=37 G=38 B=33
 
#5
//8th

	pixel_window[0][0] = 39;
	pixel_window[0][1] = 38;
	pixel_window[0][2] = 39;
	pixel_window[0][3] = 38;
	pixel_window[0][4] = 37;

	pixel_window[1][0] = 38;
	pixel_window[1][1] = 36;
	pixel_window[1][2] = 39;
	pixel_window[1][3] = 39;
	pixel_window[1][4] = 36;

	pixel_window[2][0] = 38;
	pixel_window[2][1] = 38;
	pixel_window[2][2] = 39;
	pixel_window[2][3] = 38;
	pixel_window[2][4] = 37;

	pixel_window[3][0] = 42;
	pixel_window[3][1] = 33;
	pixel_window[3][2] = 40;
	pixel_window[3][3] = 27;
	pixel_window[3][4] = 37;

	pixel_window[4][0] = 41;
	pixel_window[4][1] = 38;
	pixel_window[4][2] = 41;
	pixel_window[4][3] = 39;
	pixel_window[4][4] = 39;

	bayer_center_pixel = 2'b11;
        #1;
	$display("Expected R G B: 39	38	34");
	$display("8> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=39 G=38 B=33

#5
//9th

	pixel_window[0][0] = 38;
	pixel_window[0][1] = 39;
	pixel_window[0][2] = 38;
	pixel_window[0][3] = 37;
	pixel_window[0][4] = 39;

	pixel_window[1][0] = 36;
	pixel_window[1][1] = 39;
	pixel_window[1][2] = 39;
	pixel_window[1][3] = 36;
	pixel_window[1][4] = 27;

	pixel_window[2][0] = 38;
	pixel_window[2][1] = 39;
	pixel_window[2][2] = 38;
	pixel_window[2][3] = 37;
	pixel_window[2][4] = 36;

	pixel_window[3][0] = 33;
	pixel_window[3][1] = 40;
	pixel_window[3][2] = 27;
	pixel_window[3][3] = 37;
	pixel_window[3][4] = 41;

	pixel_window[4][0] = 38;
	pixel_window[4][1] = 41;
	pixel_window[4][2] = 39;
	pixel_window[4][3] = 39;
	pixel_window[4][4] = 39;

	bayer_center_pixel = 2'b10;
        #1;
	$display("Expected R G B: 38	38	32");
	$display("9> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=38 G=38 B=32

#5
//10th

	pixel_window[0][0] = 39;
	pixel_window[0][1] = 38;
	pixel_window[0][2] = 37;
	pixel_window[0][3] = 39;
	pixel_window[0][4] = 39;

	pixel_window[1][0] = 39;
	pixel_window[1][1] = 39;
	pixel_window[1][2] = 36;
	pixel_window[1][3] = 27;
	pixel_window[1][4] = 38;

	pixel_window[2][0] = 39;
	pixel_window[2][1] = 38;
	pixel_window[2][2] = 37;
	pixel_window[2][3] = 36;
	pixel_window[2][4] = 37;

	pixel_window[3][0] = 40;
	pixel_window[3][1] = 27;
	pixel_window[3][2] = 37;
	pixel_window[3][3] = 41;
	pixel_window[3][4] = 37;

	pixel_window[4][0] = 41;
	pixel_window[4][1] = 39;
	pixel_window[4][2] = 39;
	pixel_window[4][3] = 39;
	pixel_window[4][4] = 37;

	bayer_center_pixel = 2'b11;
        #1;
	$display("Expected R G B: 37	36	33");
	$display("10> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=37 G=36 B=32


#5
//11th

	pixel_window[0][0] = 38;
	pixel_window[0][1] = 37;
	pixel_window[0][2] = 39;
	pixel_window[0][3] = 39;
	pixel_window[0][4] = 38;

	pixel_window[1][0] = 39;
	pixel_window[1][1] = 36;
	pixel_window[1][2] = 27;
	pixel_window[1][3] = 38;
	pixel_window[1][4] = 27;

	pixel_window[2][0] = 38;
	pixel_window[2][1] = 37;
	pixel_window[2][2] = 36;
	pixel_window[2][3] = 37;
	pixel_window[2][4] = 39;

	pixel_window[3][0] = 27;
	pixel_window[3][1] = 37;
	pixel_window[3][2] = 41;
	pixel_window[3][3] = 37;
	pixel_window[3][4] = 33;

	pixel_window[4][0] = 39;
	pixel_window[4][1] = 39;
	pixel_window[4][2] = 39;
	pixel_window[4][3] = 37;
	pixel_window[4][4] = 34;

	bayer_center_pixel = 2'b10;
        #1;
	$display("Expected R G B: 36	36	33");
	$display("11> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=36 G=36 B=33

#5;     // Gray-preservation test:
        // If an area is gray, it should remain gray after demosaicing
	pixel_window[0][0] = 8'hAB;
	pixel_window[0][1] = 8'hAB;
	pixel_window[0][2] = 8'hAB;
	pixel_window[0][3] = 8'hAB;
	pixel_window[0][4] = 8'hAB;

	pixel_window[1][0] = 8'hAB;
	pixel_window[1][1] = 8'hAB;
	pixel_window[1][2] = 8'hAB;
	pixel_window[1][3] = 8'hAB;
	pixel_window[1][4] = 8'hAB;

	pixel_window[2][0] = 8'hAB;
	pixel_window[2][1] = 8'hAB;
	pixel_window[2][2] = 8'hAB;
	pixel_window[2][3] = 8'hAB;
	pixel_window[2][4] = 8'hAB;

	pixel_window[3][0] = 8'hAB;
	pixel_window[3][1] = 8'hAB;
	pixel_window[3][2] = 8'hAB;
	pixel_window[3][3] = 8'hAB;
	pixel_window[3][4] = 8'hAB;

	pixel_window[4][0] = 8'hAB;
	pixel_window[4][1] = 8'hAB;
	pixel_window[4][2] = 8'hAB;
	pixel_window[4][3] = 8'hAB;
	pixel_window[4][4] = 8'hAB;

        bayer_center_pixel = 2'b00;
        #1;
        assert (final_rgb_pixel == {8'hAB, 8'hAB, 8'hAB}) else $fatal(1, "Was %h", final_rgb_pixel);

        bayer_center_pixel = 2'b01;
        #1;
        assert (final_rgb_pixel == {8'hAB, 8'hAB, 8'hAB}) else $fatal(1, "Was %h", final_rgb_pixel);

        bayer_center_pixel = 2'b10;
        #1;
        assert (final_rgb_pixel == {8'hAB, 8'hAB, 8'hAB}) else $fatal(1, "Was %h", final_rgb_pixel);

        bayer_center_pixel = 2'b11;
        #1;
        assert (final_rgb_pixel == {8'hAB, 8'hAB, 8'hAB}) else $fatal(1, "Was %h", final_rgb_pixel);
        $display("12> Gray Preservation\n");


//Rahimullah Shaik
//Test bench code from row 11 to row 15 when sliding window is slided by 1 column 

// 38	33	41	33	18
// 31	34	33	34	33
// 18	32	27	36	39
// 32	31	33	35	36
// 29	35	27	28	31

	#5;
	pixel_window[0][0] = 38;
	pixel_window[0][1] = 33;
	pixel_window[0][2] = 41;
	pixel_window[0][3] = 33;
	pixel_window[0][4] = 18;

	pixel_window[1][0] = 31;
	pixel_window[1][1] = 34;
	pixel_window[1][2] = 33;
	pixel_window[1][3] = 34;
	pixel_window[1][4] = 33;

	pixel_window[2][0] = 18;
	pixel_window[2][1] = 32;
	pixel_window[2][2] = 27;
	pixel_window[2][3] = 36;
	pixel_window[2][4] = 39;

	pixel_window[3][0] = 32;
	pixel_window[3][1] = 31;
	pixel_window[3][2] = 33;
	pixel_window[3][3] = 35;
	pixel_window[3][4] = 36;

	pixel_window[4][0] = 29;
	pixel_window[4][1] = 35;
	pixel_window[4][2] = 27;
	pixel_window[4][3] = 28;
	pixel_window[4][4] = 31;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 30	31	27");
	$display("13> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]);//R=30, G=31, B=27

//33	41	33	18	36
//34	33	34	33	35
//32	27	36	39	36
//31	33	35	36	29
//35	27	28	31	31

#5;
pixel_window[0][0] = 33;
	pixel_window[0][1] = 41;
	pixel_window[0][2] = 33;
	pixel_window[0][3] = 18;
	pixel_window[0][4] = 36;

	pixel_window[1][0] = 34;
	pixel_window[1][1] = 33;
	pixel_window[1][2] = 34;
	pixel_window[1][3] = 33;
	pixel_window[1][4] = 35;

	pixel_window[2][0] = 32;
	pixel_window[2][1] = 27;
	pixel_window[2][2] = 36;
	pixel_window[2][3] = 39;
	pixel_window[2][4] = 36;

	pixel_window[3][0] = 31;
	pixel_window[3][1] = 33;
	pixel_window[3][2] = 35;
	pixel_window[3][3] = 36;
	pixel_window[3][4] = 29;

	pixel_window[4][0] = 35;
	pixel_window[4][1] = 27;
	pixel_window[4][2] = 28;
	pixel_window[4][3] = 31;
	pixel_window[4][4] = 31;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 36	36	33");
	$display("14> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]);//R=36, G=36, B=33

//41	33	18	36	27
//33	34	33	35	36
//27	36	39	36	27
//33	35	36	29	31
//27	28	31	31	27

#5;
pixel_window[0][0] = 41;
	pixel_window[0][1] = 33;
	pixel_window[0][2] = 18;
	pixel_window[0][3] = 36;
	pixel_window[0][4] = 27;

	pixel_window[1][0] = 33;
	pixel_window[1][1] = 34;
	pixel_window[1][2] = 33;
	pixel_window[1][3] = 35;
	pixel_window[1][4] = 36;

	pixel_window[2][0] = 27;
	pixel_window[2][1] = 36;
	pixel_window[2][2] = 39;
	pixel_window[2][3] = 36;
	pixel_window[2][4] = 27;

	pixel_window[3][0] = 33;
	pixel_window[3][1] = 35;
	pixel_window[3][2] = 36;
	pixel_window[3][3] = 29;
	pixel_window[3][4] = 31;

	pixel_window[4][0] = 27;
	pixel_window[4][1] = 28;
	pixel_window[4][2] = 31;
	pixel_window[4][3] = 31;
	pixel_window[4][4] = 27;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 43	41	39");
	$display("15> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=43, G=41, B=39

//33	18	36	27	38
//34	33	35	36	35
//36	39	36	27	36
//35	36	29	31	33
//28	31	31	27	33

#5;
pixel_window[0][0] = 33;
	pixel_window[0][1] = 18;
	pixel_window[0][2] = 36;
	pixel_window[0][3] = 27;
	pixel_window[0][4] = 38;

	pixel_window[1][0] = 34;
	pixel_window[1][1] = 33;
	pixel_window[1][2] = 35;
	pixel_window[1][3] = 36;
	pixel_window[1][4] = 35;

	pixel_window[2][0] = 36;
	pixel_window[2][1] = 39;
	pixel_window[2][2] = 36;
	pixel_window[2][3] = 27;
	pixel_window[2][4] = 36;

	pixel_window[3][0] = 35;
	pixel_window[3][1] = 36;
	pixel_window[3][2] = 29;
	pixel_window[3][3] = 31;
	pixel_window[3][4] = 33;

	pixel_window[4][0] = 28;
	pixel_window[4][1] = 31;
	pixel_window[4][2] = 31;
	pixel_window[4][3] = 27;
	pixel_window[4][4] = 33;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 33	36	33");
	$display("16> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=33, G=36, B=33

//18	36	27	38	46
//33	35	36	35	34
//39	36	27	36	29
//36	29	31	33	36
//31	31	27	33	33

#5;
pixel_window[0][0] = 18;
	pixel_window[0][1] = 36;
	pixel_window[0][2] = 27;
	pixel_window[0][3] = 38;
	pixel_window[0][4] = 46;

	pixel_window[1][0] = 33;
	pixel_window[1][1] = 35;
	pixel_window[1][2] = 36;
	pixel_window[1][3] = 35;
	pixel_window[1][4] = 34;

	pixel_window[2][0] = 39;
	pixel_window[2][1] = 36;
	pixel_window[2][2] = 27;
	pixel_window[2][3] = 36;
	pixel_window[2][4] = 29;

	pixel_window[3][0] = 36;
	pixel_window[3][1] = 29;
	pixel_window[3][2] = 31;
	pixel_window[3][3] = 33;
	pixel_window[3][4] = 36;

	pixel_window[4][0] = 31;
	pixel_window[4][1] = 31;
	pixel_window[4][2] = 27;
	pixel_window[4][3] = 33;
	pixel_window[4][4] = 33;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 30	33	27");
	$display("17> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=30, G=33, B=27

//36	27	38	46	42
//35	36	35	34	37
//36	27	36	29	38
//29	31	33	36	39
//31	27	33	33	36

#5;
pixel_window[0][0] = 36;
	pixel_window[0][1] = 27;
	pixel_window[0][2] = 38;
	pixel_window[0][3] = 46;
	pixel_window[0][4] = 42;

	pixel_window[1][0] = 35;
	pixel_window[1][1] = 36;
	pixel_window[1][2] = 35;
	pixel_window[1][3] = 34;
	pixel_window[1][4] = 37;

	pixel_window[2][0] = 36;
	pixel_window[2][1] = 27;
	pixel_window[2][2] = 36;
	pixel_window[2][3] = 29;
	pixel_window[2][4] = 38;

	pixel_window[3][0] = 29;
	pixel_window[3][1] = 31;
	pixel_window[3][2] = 33;
	pixel_window[3][3] = 36;
	pixel_window[3][4] = 39;

	pixel_window[4][0] = 31;
	pixel_window[4][1] = 27;
	pixel_window[4][2] = 33;
	pixel_window[4][3] = 33;
	pixel_window[4][4] = 36;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 35	36	28");
	$display("18> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=35, G=36, B=28

//27	38	46	42	42
//36	35	34	37	40
//27	36	29	38	33
//31	33	36	39	37
//27	33	33	36	27

#5;
pixel_window[0][0] = 27;
	pixel_window[0][1] = 38;
	pixel_window[0][2] = 46;
	pixel_window[0][3] = 42;
	pixel_window[0][4] = 42;

	pixel_window[1][0] = 36;
	pixel_window[1][1] = 35;
	pixel_window[1][2] = 34;
	pixel_window[1][3] = 37;
	pixel_window[1][4] = 40;

	pixel_window[2][0] = 27;
	pixel_window[2][1] = 36;
	pixel_window[2][2] = 29;
	pixel_window[2][3] = 38;
	pixel_window[2][4] = 33;

	pixel_window[3][0] = 31;
	pixel_window[3][1] = 33;
	pixel_window[3][2] = 36;
	pixel_window[3][3] = 39;
	pixel_window[3][4] = 37;

	pixel_window[4][0] = 27;
	pixel_window[4][1] = 33;
	pixel_window[4][2] = 33;
	pixel_window[4][3] = 36;
	pixel_window[4][4] = 27;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 31	33	29");
	$display("19> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=31,  G=33, B=29

//38	46	42	42	42
//35	34	37	40	37
//36	29	38	33	39
//33	36	39	37	39
//33	33	36	27	36

#5;
pixel_window[0][0] = 38;
	pixel_window[0][1] = 46;
	pixel_window[0][2] = 42;
	pixel_window[0][3] = 42;
	pixel_window[0][4] = 42;

	pixel_window[1][0] = 35;
	pixel_window[1][1] = 34;
	pixel_window[1][2] = 37;
	pixel_window[1][3] = 40;
	pixel_window[1][4] = 37;

	pixel_window[2][0] = 36;
	pixel_window[2][1] = 29;
	pixel_window[2][2] = 38;
	pixel_window[2][3] = 33;
	pixel_window[2][4] = 39;

	pixel_window[3][0] = 33;
	pixel_window[3][1] = 36;
	pixel_window[3][2] = 39;
	pixel_window[3][3] = 37;
	pixel_window[3][4] = 39;

	pixel_window[4][0] = 33;
	pixel_window[4][1] = 33;
	pixel_window[4][2] = 36;
	pixel_window[4][3] = 27;
	pixel_window[4][4] = 36;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 38	38	31");
	$display("20> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=38, G=38, B=31

//46	42	42	42	31
//34	37	40	37	39
//29	38	33	39	39
//36	39	37	39	39
//33	36	27	36	36

#5;
pixel_window[0][0] = 46;
	pixel_window[0][1] = 42;
	pixel_window[0][2] = 42;
	pixel_window[0][3] = 42;
	pixel_window[0][4] = 31;

	pixel_window[1][0] = 34;
	pixel_window[1][1] = 37;
	pixel_window[1][2] = 40;
	pixel_window[1][3] = 37;
	pixel_window[1][4] = 39;

	pixel_window[2][0] = 29;
	pixel_window[2][1] = 38;
	pixel_window[2][2] = 33;
	pixel_window[2][3] = 39;
	pixel_window[2][4] = 39;

	pixel_window[3][0] = 36;
	pixel_window[3][1] = 39;
	pixel_window[3][2] = 37;
	pixel_window[3][3] = 39;
	pixel_window[3][4] = 39;

	pixel_window[4][0] = 33;
	pixel_window[4][1] = 36;
	pixel_window[4][2] = 27;
	pixel_window[4][3] = 36;
	pixel_window[4][4] = 36;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 37	37	33");
	$display("21> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=37, G=37, B=33

//42	42	42	31	37
//37	40	37	39	36
//38	33	39	39	35
//39	37	39	39	37
//36	27	36	36	38

#5;
pixel_window[0][0] = 42;
	pixel_window[0][1] = 42;
	pixel_window[0][2] = 42;
	pixel_window[0][3] = 31;
	pixel_window[0][4] = 37;

	pixel_window[1][0] = 37;
	pixel_window[1][1] = 40;
	pixel_window[1][2] = 37;
	pixel_window[1][3] = 39;
	pixel_window[1][4] = 36;

	pixel_window[2][0] = 38;
	pixel_window[2][1] = 33;
	pixel_window[2][2] = 39;
	pixel_window[2][3] = 39;
	pixel_window[2][4] = 35;

	pixel_window[3][0] = 39;
	pixel_window[3][1] = 37;
	pixel_window[3][2] = 39;
	pixel_window[3][3] = 39;
	pixel_window[3][4] = 37;

	pixel_window[4][0] = 36;
	pixel_window[4][1] = 27;
	pixel_window[4][2] = 36;
	pixel_window[4][3] = 36;
	pixel_window[4][4] = 38;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 37	39	36");
	$display("22> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=37, G=39, B=36

//42	42	31	37	33
//40	37	39	36	40
//33	39	39	35	21
//37	39	39	37	36
//27	36	36	38	38

#5;
pixel_window[0][0] = 42;
	pixel_window[0][1] = 42;
	pixel_window[0][2] = 31;
	pixel_window[0][3] = 37;
	pixel_window[0][4] = 33;

	pixel_window[1][0] = 40;
	pixel_window[1][1] = 37;
	pixel_window[1][2] = 39;
	pixel_window[1][3] = 36;
	pixel_window[1][4] = 40;

	pixel_window[2][0] = 33;
	pixel_window[2][1] = 39;
	pixel_window[2][2] = 39;
	pixel_window[2][3] = 35;
	pixel_window[2][4] = 21;

	pixel_window[3][0] = 37;
	pixel_window[3][1] = 39;
	pixel_window[3][2] = 39;
	pixel_window[3][3] = 37;
	pixel_window[3][4] = 36;

	pixel_window[4][0] = 27;
	pixel_window[4][1] = 36;
	pixel_window[4][2] = 36;
	pixel_window[4][3] = 38;
	pixel_window[4][4] = 38;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 44	42	39");
	$display("23> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=43, G=42, B=39

//42	31	37	33	35
//37	39	36	40	36
//39	39	35	21	33
//39	39	37	36	35
//36	36	38	38	30


#5;
pixel_window[0][0] = 42;
	pixel_window[0][1] = 31;
	pixel_window[0][2] = 37;
	pixel_window[0][3] = 33;
	pixel_window[0][4] = 35;

	pixel_window[1][0] = 37;
	pixel_window[1][1] = 39;
	pixel_window[1][2] = 36;
	pixel_window[1][3] = 40;
	pixel_window[1][4] = 36;

	pixel_window[2][0] = 39;
	pixel_window[2][1] = 39;
	pixel_window[2][2] = 35;
	pixel_window[2][3] = 21;
	pixel_window[2][4] = 33;

	pixel_window[3][0] = 39;
	pixel_window[3][1] = 39;
	pixel_window[3][2] = 37;
	pixel_window[3][3] = 36;
	pixel_window[3][4] = 35;

	pixel_window[4][0] = 36;
	pixel_window[4][1] = 36;
	pixel_window[4][2] = 38;
	pixel_window[4][3] = 38;
	pixel_window[4][4] = 30;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 34	35	28");
	$display("24> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=34, G=35, B=28


//31	37	33	35	33
//39	36	40	36	33
//39	35	21	33	27
//39	37	36	35	34
//36	38	38	30	38

#5;
pixel_window[0][0] = 31;
	pixel_window[0][1] = 37;
	pixel_window[0][2] = 33;
	pixel_window[0][3] = 35;
	pixel_window[0][4] = 33;

	pixel_window[1][0] = 39;
	pixel_window[1][1] = 36;
	pixel_window[1][2] = 40;
	pixel_window[1][3] = 36;
	pixel_window[1][4] = 33;

	pixel_window[2][0] = 39;
	pixel_window[2][1] = 35;
	pixel_window[2][2] = 21;
	pixel_window[2][3] = 33;
	pixel_window[2][4] = 27;

	pixel_window[3][0] = 39;
	pixel_window[3][1] = 37;
	pixel_window[3][2] = 36;
	pixel_window[3][3] = 35;
	pixel_window[3][4] = 34;

	pixel_window[4][0] = 36;
	pixel_window[4][1] = 38;
	pixel_window[4][2] = 38;
	pixel_window[4][3] = 30;
	pixel_window[4][4] = 38;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 26	29	21");
	$display("25> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=26, G=29, B=21


//37	33	35	33	32
//36	40	36	33	28
//35	21	33	27	28
//37	36	35	34	30
//38	38	30	38	33

#5;
pixel_window[0][0] = 37;
	pixel_window[0][1] = 33;
	pixel_window[0][2] = 35;
	pixel_window[0][3] = 33;
	pixel_window[0][4] = 32;

	pixel_window[1][0] = 36;
	pixel_window[1][1] = 40;
	pixel_window[1][2] = 36;
	pixel_window[1][3] = 33;
	pixel_window[1][4] = 28;

	pixel_window[2][0] = 35;
	pixel_window[2][1] = 21;
	pixel_window[2][2] = 33;
	pixel_window[2][3] = 27;
	pixel_window[2][4] = 28;

	pixel_window[3][0] = 37;
	pixel_window[3][1] = 36;
	pixel_window[3][2] = 35;
	pixel_window[3][3] = 34;
	pixel_window[3][4] = 30;

	pixel_window[4][0] = 38;
	pixel_window[4][1] = 38;
	pixel_window[4][2] = 30;
	pixel_window[4][3] = 38;
	pixel_window[4][4] = 33;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 34	33	22");
	$display("26> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=34, G=33, B=22

//33	35	33	32	29
//40	36	33	28	30
//21	33	27	28	27
//36	35	34	30	30
//38	30	38	33	27

#5;
pixel_window[0][0] = 33;
	pixel_window[0][1] = 35;
	pixel_window[0][2] = 33;
	pixel_window[0][3] = 32;
	pixel_window[0][4] = 29;

	pixel_window[1][0] = 40;
	pixel_window[1][1] = 36;
	pixel_window[1][2] = 33;
	pixel_window[1][3] = 28;
	pixel_window[1][4] = 30;

	pixel_window[2][0] = 21;
	pixel_window[2][1] = 33;
	pixel_window[2][2] = 27;
	pixel_window[2][3] = 28;
	pixel_window[2][4] = 27;

	pixel_window[3][0] = 36;
	pixel_window[3][1] = 35;
	pixel_window[3][2] = 34;
	pixel_window[3][3] = 30;
	pixel_window[3][4] = 30;

	pixel_window[4][0] = 38;
	pixel_window[4][1] = 30;
	pixel_window[4][2] = 38;
	pixel_window[4][3] = 33;
	pixel_window[4][4] = 27;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 30	30	27");
	$display("27> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=30, G=30, B=27

//35	33	32	29	30
//36	33	28	30	28
//33	27	28	27	28
//35	34	30	30	28
//30	38	33	27	30

#5;
pixel_window[0][0] = 35;
	pixel_window[0][1] = 33;
	pixel_window[0][2] = 32;
	pixel_window[0][3] = 29;
	pixel_window[0][4] = 30;

	pixel_window[1][0] = 36;
	pixel_window[1][1] = 33;
	pixel_window[1][2] = 28;
	pixel_window[1][3] = 30;
	pixel_window[1][4] = 28;

	pixel_window[2][0] = 33;
	pixel_window[2][1] = 27;
	pixel_window[2][2] = 28;
	pixel_window[2][3] = 27;
	pixel_window[2][4] = 28;

	pixel_window[3][0] = 35;
	pixel_window[3][1] = 34;
	pixel_window[3][2] = 30;
	pixel_window[3][3] = 30;
	pixel_window[3][4] = 28;

	pixel_window[4][0] = 30;
	pixel_window[4][1] = 38;
	pixel_window[4][2] = 33;
	pixel_window[4][3] = 27;
	pixel_window[4][4] = 30;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 26	28	25");
	$display("28> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=26, G=28, B=25

//33	32	29	30	18
//33	28	30	28	29
//27	28	27	28	25
//34	30	30	28	30
//38	33	27	30	18


#5;
pixel_window[0][0] = 33;
	pixel_window[0][1] = 32;
	pixel_window[0][2] = 29;
	pixel_window[0][3] = 30;
	pixel_window[0][4] = 18;

	pixel_window[1][0] = 33;
	pixel_window[1][1] = 28;
	pixel_window[1][2] = 30;
	pixel_window[1][3] = 28;
	pixel_window[1][4] = 29;

	pixel_window[2][0] = 27;
	pixel_window[2][1] = 28;
	pixel_window[2][2] = 27;
	pixel_window[2][3] = 28;
	pixel_window[2][4] = 25;

	pixel_window[3][0] = 34;
	pixel_window[3][1] = 30;
	pixel_window[3][2] = 30;
	pixel_window[3][3] = 28;
	pixel_window[3][4] = 30;

	pixel_window[4][0] = 38;
	pixel_window[4][1] = 33;
	pixel_window[4][2] = 27;
	pixel_window[4][3] = 30;
	pixel_window[4][4] = 18;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 28	29	27");
	$display("29> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=28, G=29, B=27

//32	29	30	18	28
//28	30	28	29	24
//28	27	28	25	29
//30	30	28	30	24
//33	27	30	18	28

#5;
pixel_window[0][0] = 32;
	pixel_window[0][1] = 29;
	pixel_window[0][2] = 30;
	pixel_window[0][3] = 18;
	pixel_window[0][4] = 28;

	pixel_window[1][0] = 28;
	pixel_window[1][1] = 30;
	pixel_window[1][2] = 28;
	pixel_window[1][3] = 29;
	pixel_window[1][4] = 24;

	pixel_window[2][0] = 28;
	pixel_window[2][1] = 27;
	pixel_window[2][2] = 28;
	pixel_window[2][3] = 25;
	pixel_window[2][4] = 29;

	pixel_window[3][0] = 30;
	pixel_window[3][1] = 30;
	pixel_window[3][2] = 28;
	pixel_window[3][3] = 30;
	pixel_window[3][4] = 24;

	pixel_window[4][0] = 33;
	pixel_window[4][1] = 27;
	pixel_window[4][2] = 30;
	pixel_window[4][3] = 18;
	pixel_window[4][4] = 28;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 26	28	25");
	$display("30> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=26, G=28, B=25

//29	30	18	28	21
//30	28	29	24	28
//27	28	25	29	16
//30	28	30	24	28
//27	30	18	28	29

#5;
pixel_window[0][0] = 29;
	pixel_window[0][1] = 30;
	pixel_window[0][2] = 18;
	pixel_window[0][3] = 28;
	pixel_window[0][4] = 21;

	pixel_window[1][0] = 30;
	pixel_window[1][1] = 28;
	pixel_window[1][2] = 29;
	pixel_window[1][3] = 24;
	pixel_window[1][4] = 28;

	pixel_window[2][0] = 27;
	pixel_window[2][1] = 28;
	pixel_window[2][2] = 25;
	pixel_window[2][3] = 29;
	pixel_window[2][4] = 16;

	pixel_window[3][0] = 30;
	pixel_window[3][1] = 28;
	pixel_window[3][2] = 30;
	pixel_window[3][3] = 24;
	pixel_window[3][4] = 28;

	pixel_window[4][0] = 27;
	pixel_window[4][1] = 30;
	pixel_window[4][2] = 18;
	pixel_window[4][3] = 28;
	pixel_window[4][4] = 29;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 30	31	25");
	$display("31> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=29, G=31, B=25

//30	18	28	21	28
//28	29	24	28	27
//28	25	29	16	28
//28	30	24	28	29
//30	18	28	29	28

#5;
pixel_window[0][0] = 30;
	pixel_window[0][1] = 18;
	pixel_window[0][2] = 28;
	pixel_window[0][3] = 21;
	pixel_window[0][4] = 28;

	pixel_window[1][0] = 28;
	pixel_window[1][1] = 29;
	pixel_window[1][2] = 24;
	pixel_window[1][3] = 28;
	pixel_window[1][4] = 27;

	pixel_window[2][0] = 28;
	pixel_window[2][1] = 25;
	pixel_window[2][2] = 29;
	pixel_window[2][3] = 16;
	pixel_window[2][4] = 28;

	pixel_window[3][0] = 28;
	pixel_window[3][1] = 30;
	pixel_window[3][2] = 24;
	pixel_window[3][3] = 28;
	pixel_window[3][4] = 29;

	pixel_window[4][0] = 30;
	pixel_window[4][1] = 18;
	pixel_window[4][2] = 28;
	pixel_window[4][3] = 29;
	pixel_window[4][4] = 28;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 24	29	20");
	$display("32> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=24, G=29, B=20


//18	28	21	28	18
//29	24	28	27	25
//25	29	16	28	29
//30	24	28	29	28
//18	28	29	28	16

#5;
pixel_window[0][0] = 18;
	pixel_window[0][1] = 28;
	pixel_window[0][2] = 21;
	pixel_window[0][3] = 28;
	pixel_window[0][4] = 18;

	pixel_window[1][0] = 29;
	pixel_window[1][1] = 24;
	pixel_window[1][2] = 28;
	pixel_window[1][3] = 27;
	pixel_window[1][4] = 25;

	pixel_window[2][0] = 25;
	pixel_window[2][1] = 29;
	pixel_window[2][2] = 16;
	pixel_window[2][3] = 28;
	pixel_window[2][4] = 29;

	pixel_window[3][0] = 30;
	pixel_window[3][1] = 24;
	pixel_window[3][2] = 28;
	pixel_window[3][3] = 29;
	pixel_window[3][4] = 28;

	pixel_window[4][0] = 18;
	pixel_window[4][1] = 28;
	pixel_window[4][2] = 29;
	pixel_window[4][3] = 28;
	pixel_window[4][4] = 16;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 18	23	16");
	$display("33> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=18, G=23, B=16

//28	21	28	18	32
//24	28	27	25	29
//29	16	28	29	27
//24	28	29	28	29
//28	29	28	16	28

#5;
pixel_window[0][0] = 28;
	pixel_window[0][1] = 21;
	pixel_window[0][2] = 28;
	pixel_window[0][3] = 18;
	pixel_window[0][4] = 32;

	pixel_window[1][0] = 24;
	pixel_window[1][1] = 28;
	pixel_window[1][2] = 27;
	pixel_window[1][3] = 25;
	pixel_window[1][4] = 29;

	pixel_window[2][0] = 29;
	pixel_window[2][1] = 16;
	pixel_window[2][2] = 28;
	pixel_window[2][3] = 29;
	pixel_window[2][4] = 27;

	pixel_window[3][0] = 24;
	pixel_window[3][1] = 28;
	pixel_window[3][2] = 29;
	pixel_window[3][3] = 28;
	pixel_window[3][4] = 29;

	pixel_window[4][0] = 28;
	pixel_window[4][1] = 29;
	pixel_window[4][2] = 28;
	pixel_window[4][3] = 16;
	pixel_window[4][4] = 28;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 28	28	22");
	$display("34> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=28, G=28, B=22

//21	28	18	32	27
//28	27	25	29	33
//16	28	29	27	29
//28	29	28	29	30
//29	28	16	28	31

#5;
pixel_window[0][0] = 21;
	pixel_window[0][1] = 28;
	pixel_window[0][2] = 18;
	pixel_window[0][3] = 32;
	pixel_window[0][4] = 27;

	pixel_window[1][0] = 28;
	pixel_window[1][1] = 27;
	pixel_window[1][2] = 25;
	pixel_window[1][3] = 29;
	pixel_window[1][4] = 33;

	pixel_window[2][0] = 16;
	pixel_window[2][1] = 28;
	pixel_window[2][2] = 29;
	pixel_window[2][3] = 27;
	pixel_window[2][4] = 29;

	pixel_window[3][0] = 28;
	pixel_window[3][1] = 29;
	pixel_window[3][2] = 28;
	pixel_window[3][3] = 29;
	pixel_window[3][4] = 30;

	pixel_window[4][0] = 29;
	pixel_window[4][1] = 28;
	pixel_window[4][2] = 16;
	pixel_window[4][3] = 28;
	pixel_window[4][4] = 31;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 35	31	29");
	$display("35> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=35, G=31, B=29

//28	18	32	27	32
//27	25	29	33	33
//28	29	27	29	28
//29	28	29	30	30
//28	16	28	31	32

#5;
pixel_window[0][0] = 28;
	pixel_window[0][1] = 18;
	pixel_window[0][2] = 32;
	pixel_window[0][3] = 27;
	pixel_window[0][4] = 32;

	pixel_window[1][0] = 27;
	pixel_window[1][1] = 25;
	pixel_window[1][2] = 29;
	pixel_window[1][3] = 33;
	pixel_window[1][4] = 33;

	pixel_window[2][0] = 28;
	pixel_window[2][1] = 29;
	pixel_window[2][2] = 27;
	pixel_window[2][3] = 29;
	pixel_window[2][4] = 28;

	pixel_window[3][0] = 29;
	pixel_window[3][1] = 28;
	pixel_window[3][2] = 29;
	pixel_window[3][3] = 30;
	pixel_window[3][4] = 30;

	pixel_window[4][0] = 28;
	pixel_window[4][1] = 16;
	pixel_window[4][2] = 28;
	pixel_window[4][3] = 31;
	pixel_window[4][4] = 32;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 27	27	28");
	$display("36> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=27, G=27, B=28

//18	32	27	32	25
//25	29	33	33	36
//29	27	29	28	31
//28	29	30	30	33
//16	28	31	32	31

#5;
pixel_window[0][0] = 18;
	pixel_window[0][1] = 32;
	pixel_window[0][2] = 27;
	pixel_window[0][3] = 32;
	pixel_window[0][4] = 25;

	pixel_window[1][0] = 25;
	pixel_window[1][1] = 29;
	pixel_window[1][2] = 33;
	pixel_window[1][3] = 33;
	pixel_window[1][4] = 36;

	pixel_window[2][0] = 29;
	pixel_window[2][1] = 27;
	pixel_window[2][2] = 29;
	pixel_window[2][3] = 28;
	pixel_window[2][4] = 31;

	pixel_window[3][0] = 28;
	pixel_window[3][1] = 29;
	pixel_window[3][2] = 30;
	pixel_window[3][3] = 30;
	pixel_window[3][4] = 33;

	pixel_window[4][0] = 16;
	pixel_window[4][1] = 28;
	pixel_window[4][2] = 31;
	pixel_window[4][3] = 32;
	pixel_window[4][4] = 31;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 30	29	29");
	$display("37> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=29, G=29, B=29

//32	27	32	25	31
//29	33	33	36	33
//27	29	28	31	33
//29	30	30	33	34
//28	31	32	31	28

#5;
pixel_window[0][0] = 32;
	pixel_window[0][1] = 27;
	pixel_window[0][2] = 32;
	pixel_window[0][3] = 25;
	pixel_window[0][4] = 31;

	pixel_window[1][0] = 29;
	pixel_window[1][1] = 33;
	pixel_window[1][2] = 33;
	pixel_window[1][3] = 36;
	pixel_window[1][4] = 33;

	pixel_window[2][0] = 27;
	pixel_window[2][1] = 29;
	pixel_window[2][2] = 28;
	pixel_window[2][3] = 31;
	pixel_window[2][4] = 33;

	pixel_window[3][0] = 29;
	pixel_window[3][1] = 30;
	pixel_window[3][2] = 30;
	pixel_window[3][3] = 33;
	pixel_window[3][4] = 34;

	pixel_window[4][0] = 28;
	pixel_window[4][1] = 31;
	pixel_window[4][2] = 32;
	pixel_window[4][3] = 31;
	pixel_window[4][4] = 28;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 28	28	27");
	$display("38> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=28, G=28, B=27

//27	32	25	31	33
//33	33	36	33	32
//29	28	31	33	33
//30	30	33	34	35
//31	32	31	28	27

#5;
pixel_window[0][0] = 27;
	pixel_window[0][1] = 32;
	pixel_window[0][2] = 25;
	pixel_window[0][3] = 31;
	pixel_window[0][4] = 33;

	pixel_window[1][0] = 33;
	pixel_window[1][1] = 33;
	pixel_window[1][2] = 36;
	pixel_window[1][3] = 33;
	pixel_window[1][4] = 32;

	pixel_window[2][0] = 29;
	pixel_window[2][1] = 28;
	pixel_window[2][2] = 31;
	pixel_window[2][3] = 33;
	pixel_window[2][4] = 33;

	pixel_window[3][0] = 30;
	pixel_window[3][1] = 30;
	pixel_window[3][2] = 33;
	pixel_window[3][3] = 34;
	pixel_window[3][4] = 35;

	pixel_window[4][0] = 31;
	pixel_window[4][1] = 32;
	pixel_window[4][2] = 31;
	pixel_window[4][3] = 28;
	pixel_window[4][4] = 27;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 33	33	31");
	$display("39> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=33, G=33, B=31

//32	25	31	33	28
//33	36	33	32	33
//28	31	33	33	28
//30	33	34	35	30
//32	31	28	27	34

#5;
pixel_window[0][0] = 32;
	pixel_window[0][1] = 25;
	pixel_window[0][2] = 31;
	pixel_window[0][3] = 33;
	pixel_window[0][4] = 28;

	pixel_window[1][0] = 33;
	pixel_window[1][1] = 36;
	pixel_window[1][2] = 33;
	pixel_window[1][3] = 32;
	pixel_window[1][4] = 33;

	pixel_window[2][0] = 28;
	pixel_window[2][1] = 31;
	pixel_window[2][2] = 33;
	pixel_window[2][3] = 33;
	pixel_window[2][4] = 28;

	pixel_window[3][0] = 30;
	pixel_window[3][1] = 33;
	pixel_window[3][2] = 34;
	pixel_window[3][3] = 35;
	pixel_window[3][4] = 30;

	pixel_window[4][0] = 32;
	pixel_window[4][1] = 31;
	pixel_window[4][2] = 28;
	pixel_window[4][3] = 27;
	pixel_window[4][4] = 34;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 33,	33,	32");
	$display("40> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=33, G=33, B=32

//25	31	33	28	36
//36	33	32	33	34
//31	33	33	28	33
//33	34	35	30	32
//31	28	27	34	31


#5;
pixel_window[0][0] = 25;
	pixel_window[0][1] = 31;
	pixel_window[0][2] = 33;
	pixel_window[0][3] = 28;
	pixel_window[0][4] = 36;

	pixel_window[1][0] = 36;
	pixel_window[1][1] = 33;
	pixel_window[1][2] = 32;
	pixel_window[1][3] = 33;
	pixel_window[1][4] = 34;

	pixel_window[2][0] = 31;
	pixel_window[2][1] = 33;
	pixel_window[2][2] = 33;
	pixel_window[2][3] = 28;
	pixel_window[2][4] = 33;

	pixel_window[3][0] = 33;
	pixel_window[3][1] = 34;
	pixel_window[3][2] = 35;
	pixel_window[3][3] = 30;
	pixel_window[3][4] = 32;

	pixel_window[4][0] = 31;
	pixel_window[4][1] = 28;
	pixel_window[4][2] = 27;
	pixel_window[4][3] = 34;
	pixel_window[4][4] = 31;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 34	33	33");	
	$display("41> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=34, G=33, B=33

//31	33	28	36	32
//33	32	33	34	32
//33	33	28	33	34
//34	35	30	32	30
//28	27	34	31	29


#5;
pixel_window[0][0] = 31;
	pixel_window[0][1] = 33;
	pixel_window[0][2] = 28;
	pixel_window[0][3] = 36;
	pixel_window[0][4] = 32;

	pixel_window[1][0] = 33;
	pixel_window[1][1] = 32;
	pixel_window[1][2] = 33;
	pixel_window[1][3] = 34;
	pixel_window[1][4] = 32;

	pixel_window[2][0] = 33;
	pixel_window[2][1] = 33;
	pixel_window[2][2] = 28;
	pixel_window[2][3] = 33;
	pixel_window[2][4] = 34;

	pixel_window[3][0] = 34;
	pixel_window[3][1] = 35;
	pixel_window[3][2] = 30;
	pixel_window[3][3] = 32;
	pixel_window[3][4] = 30;

	pixel_window[4][0] = 28;
	pixel_window[4][1] = 27;
	pixel_window[4][2] = 34;
	pixel_window[4][3] = 31;
	pixel_window[4][4] = 29;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 28	28	29");
	$display("42> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=28, G=28, B=29

//33	28	36	32	36
//32	33	34	32	33
//33	28	33	34	33
//35	30	32	30	31
//27	34	31	29	29


#5;
pixel_window[0][0] = 33;
	pixel_window[0][1] = 28;
	pixel_window[0][2] = 36;
	pixel_window[0][3] = 32;
	pixel_window[0][4] = 36;

	pixel_window[1][0] = 32;
	pixel_window[1][1] = 33;
	pixel_window[1][2] = 34;
	pixel_window[1][3] = 32;
	pixel_window[1][4] = 33;

	pixel_window[2][0] = 33;
	pixel_window[2][1] = 28;
	pixel_window[2][2] = 33;
	pixel_window[2][3] = 34;
	pixel_window[2][4] = 33;

	pixel_window[3][0] = 35;
	pixel_window[3][1] = 30;
	pixel_window[3][2] = 32;
	pixel_window[3][3] = 30;
	pixel_window[3][4] = 31;

	pixel_window[4][0] = 27;
	pixel_window[4][1] = 34;
	pixel_window[4][2] = 31;
	pixel_window[4][3] = 29;
	pixel_window[4][4] = 29;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 31	31	33");
	$display("43> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=31, G=31, B=33


//Sagnik Basu

	#5;
	pixel_window[0][0] = 31;
	pixel_window[0][1] = 30;
	pixel_window[0][2] = 33;
	pixel_window[0][3] = 28;
	pixel_window[0][4] = 32;

	pixel_window[1][0] = 28;
	pixel_window[1][1] = 27;
	pixel_window[1][2] = 28;
	pixel_window[1][3] = 29;
	pixel_window[1][4] = 32;

	pixel_window[2][0] = 24;
	pixel_window[2][1] = 30;
	pixel_window[2][2] = 23;
	pixel_window[2][3] = 28;
	pixel_window[2][4] = 27;

	pixel_window[3][0] = 27;
	pixel_window[3][1] = 25;
	pixel_window[3][2] = 27;
	pixel_window[3][3] = 25;
	pixel_window[3][4] = 29;

	pixel_window[4][0] = 27;
	pixel_window[4][1] = 24;
	pixel_window[4][2] = 22;
	pixel_window[4][3] = 28;
	pixel_window[4][4] = 23;

	bayer_center_pixel = 2'b11;
        #1;
	$display("Expected R G B: 23   26	24");
	$display("44> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // 31 32 33




#5;
	pixel_window[0][0] = 30;
	pixel_window[0][1] = 33;
	pixel_window[0][2] = 28;
	pixel_window[0][3] = 32;
	pixel_window[0][4] = 33;

	pixel_window[1][0] = 27;
	pixel_window[1][1] = 28;
	pixel_window[1][2] = 29;
	pixel_window[1][3] = 32;
	pixel_window[1][4] = 33;

	pixel_window[2][0] = 30;
	pixel_window[2][1] = 23;
	pixel_window[2][2] = 28;
	pixel_window[2][3] = 27;
	pixel_window[2][4] = 28;

	pixel_window[3][0] = 25;
	pixel_window[3][1] = 27;
	pixel_window[3][2] = 25;
	pixel_window[3][3] = 29;
	pixel_window[3][4] = 27;

	pixel_window[4][0] = 24;
	pixel_window[4][1] = 22;
	pixel_window[4][2] = 28;
	pixel_window[4][3] = 23;
	pixel_window[4][4] = 28;

	bayer_center_pixel = 2'b10;
        #1;
	$display("Expected R G B: 24	28	 26");
	$display("45> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // 31 32 32




//Lamshe Raja

	// input-1
	pixel_window[0][0] = 27;
	pixel_window[0][1] = 32;
	pixel_window[0][2] = 39;
	pixel_window[0][3] = 35;
	pixel_window[0][4] = 33;

	pixel_window[1][0] = 27;
	pixel_window[1][1] = 33;
	pixel_window[1][2] = 32;
	pixel_window[1][3] = 38;
	pixel_window[1][4] = 33;

	pixel_window[2][0] = 36;
	pixel_window[2][1] = 34;
	pixel_window[2][2] = 33;
	pixel_window[2][3] = 35;
	pixel_window[2][4] = 39;

	pixel_window[3][0] = 33;
	pixel_window[3][1] = 33;
	pixel_window[3][2] = 38;
	pixel_window[3][3] = 36;
	pixel_window[3][4] = 41;

	pixel_window[4][0] = 27;
	pixel_window[4][1] = 36;
	pixel_window[4][2] = 39;
	pixel_window[4][3] = 39;
	pixel_window[4][4] = 36;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 31	32	33");
	$display("46> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); // R=31, G=32, B=33

	// input -2
	#5;
	pixel_window[0][0] = 32;
	pixel_window[0][1] = 39;
	pixel_window[0][2] = 35;
	pixel_window[0][3] = 33;
	pixel_window[0][4] = 34;

	pixel_window[1][0] = 33;
	pixel_window[1][1] = 32;
	pixel_window[1][2] = 38;
	pixel_window[1][3] = 33;
	pixel_window[1][4] = 39;

	pixel_window[2][0] = 34;
	pixel_window[2][1] = 33;
	pixel_window[2][2] = 35;
	pixel_window[2][3] = 39;
	pixel_window[2][4] = 37;

	pixel_window[3][0] = 33;
	pixel_window[3][1] = 38;
	pixel_window[3][2] = 36;
	pixel_window[3][3] = 41;
	pixel_window[3][4] = 41;

	pixel_window[4][0] = 36;
	pixel_window[4][1] = 39;
	pixel_window[4][2] = 39;
	pixel_window[4][3] = 36;
	pixel_window[4][4] = 39;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 36	35	35");
	$display("47> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); 	//R=36, G=35, B=35


	// input - 3
	pixel_window[0][0] = 39;
	pixel_window[0][1] = 35;
	pixel_window[0][2] = 33;
	pixel_window[0][3] = 34;
	pixel_window[0][4] = 42;

	pixel_window[1][0] = 32;
	pixel_window[1][1] = 38;
	pixel_window[1][2] = 33;
	pixel_window[1][3] = 39;
	pixel_window[1][4] = 40;

	pixel_window[2][0] = 33;
	pixel_window[2][1] = 35;
	pixel_window[2][2] = 39;
	pixel_window[2][3] = 37;
	pixel_window[2][4] = 42;

	pixel_window[3][0] = 38;
	pixel_window[3][1] = 36;
	pixel_window[3][2] = 41;
	pixel_window[3][3] = 41;
	pixel_window[3][4] = 43;

	pixel_window[4][0] = 39;
	pixel_window[4][1] = 39;
	pixel_window[4][2] = 36;
	pixel_window[4][3] = 39;
	pixel_window[4][4] = 39;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 40	38	39");
	$display("48> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]);// 	R=40,G=38,B=39



	// input - 4
	pixel_window[0][0] = 35;
	pixel_window[0][1] = 33;
	pixel_window[0][2] = 34;
	pixel_window[0][3] = 42;
	pixel_window[0][4] = 36;

	pixel_window[1][0] = 38;
	pixel_window[1][1] = 33;
	pixel_window[1][2] = 39;
	pixel_window[1][3] = 40;
	pixel_window[1][4] = 36;

	pixel_window[2][0] = 35;
	pixel_window[2][1] = 39;
	pixel_window[2][2] = 37;
	pixel_window[2][3] = 42;
	pixel_window[2][4] = 37;

	pixel_window[3][0] = 36;
	pixel_window[3][1] = 41;
	pixel_window[3][2] = 41;
	pixel_window[3][3] = 43;
	pixel_window[3][4] = 41;

	pixel_window[4][0] = 39;
	pixel_window[4][1] = 36;
	pixel_window[4][2] = 39;
	pixel_window[4][3] = 39;
	pixel_window[4][4] = 39;

	bayer_center_pixel = 2'b01;
        #1;
	$display("Expected R G B: 38	37	39");
	$display("49> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //	//R=38,G=37,B=39


	// input - 5
	pixel_window[0][0] = 33;
	pixel_window[0][1] = 34;
	pixel_window[0][2] = 42;
	pixel_window[0][3] = 36;
	pixel_window[0][4] = 33;

	pixel_window[1][0] = 33;
	pixel_window[1][1] = 39;
	pixel_window[1][2] = 40;
	pixel_window[1][3] = 36;
	pixel_window[1][4] = 36;

	pixel_window[2][0] = 39;
	pixel_window[2][1] = 37;
	pixel_window[2][2] = 42;
	pixel_window[2][3] = 37;
	pixel_window[2][4] = 39;

	pixel_window[3][0] = 41;
	pixel_window[3][1] = 41;
	pixel_window[3][2] = 43;
	pixel_window[3][3] = 41;
	pixel_window[3][4] = 43;

	pixel_window[4][0] = 36;
	pixel_window[4][1] = 39;
	pixel_window[4][2] = 39;
	pixel_window[4][3] = 39;
	pixel_window[4][4] = 39;

	bayer_center_pixel = 2'b00;
        #1;
	$display("Expected R G B: 41	40	42");
	$display("50> final_rgb_value = %d, %d, %d",final_rgb_pixel[23:16],final_rgb_pixel[15:8],final_rgb_pixel[7:0]); //R=40, G=40, B=42 



        #10$stop;
    end

endmodule

