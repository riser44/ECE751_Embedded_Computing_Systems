//******************************************* ECE 751: Team Olympus *********************************************************************************//
//Members: Rahimullah Shaik, Jagdish Mohapatra, Sagnik Basu, Lamshe Raja 

// bayer_center_pixel =
			    // 0 = Blue
			    // 1 = Green in blue row (in BGGR, the first green)
			    // 2 = Green in red row (in BGGR, the second green)
			    // 3 = Red

// It is expected that the center pixel will always be present, otherwise the behavior is undefined.



module demosaicing (
    input logic [7:0] pixel_window [0:4] [0:4],
    input logic pixel_row_en [0:4],
    input logic pixel_col_en [0:4],
    input logic [1:0] bayer_center_pixel,
    output logic [23:0] final_rgb_pixel
);
logic [11:0] G_at_non_G;
logic [3:0] G_at_non_G_count;
logic [11:0] non_G_at_non_G;
logic [4:0] non_G_at_non_G_count;
logic [11:0] non_G_at_same_G_row;
logic [4:0] non_G_at_same_G_row_count;
logic [11:0] non_G_at_diff_G_row;
logic [4:0] non_G_at_diff_G_row_count;

logic pixel_enable_matrix [0:4] [0:4];

integer i, j;


always_comb
begin
    for (i = 0; i < 5; i++)
        for (j = 0; j < 5; j++)
            pixel_enable_matrix[i][j] = pixel_row_en[i] && pixel_col_en[j];
end


always_comb
begin
    non_G_at_non_G = 12'd6 * 12'(pixel_window[2][2]);
    non_G_at_non_G_count = 4'd6;

    if (pixel_enable_matrix[1][1])
    begin
        non_G_at_non_G = non_G_at_non_G + 12'(12'd2 * 12'(pixel_window[1][1]));
        non_G_at_non_G_count = non_G_at_non_G_count + 4'd2;
    end
    if (pixel_enable_matrix[1][3])
    begin
        non_G_at_non_G = non_G_at_non_G + 12'(12'd2 * 12'(pixel_window[1][3]));
        non_G_at_non_G_count = non_G_at_non_G_count + 4'd2;
    end
    if (pixel_enable_matrix[3][3])
    begin
        non_G_at_non_G = non_G_at_non_G + 12'(12'd2 * 12'(pixel_window[3][3]));
        non_G_at_non_G_count = non_G_at_non_G_count + 4'd2;
    end
    if (pixel_enable_matrix[3][1])
    begin
        non_G_at_non_G = non_G_at_non_G + 12'(12'd2 * 12'(pixel_window[3][1]));
        non_G_at_non_G_count = non_G_at_non_G_count + 4'd2;
    end

    if (pixel_enable_matrix[0][2])
        non_G_at_non_G = non_G_at_non_G - 12'((12'd3 * 12'(pixel_window[0][2])) / 12'd2);
    if (pixel_enable_matrix[4][2])
        non_G_at_non_G = non_G_at_non_G - 12'((12'd3 * 12'(pixel_window[4][2])) / 12'd2);
    if (pixel_enable_matrix[2][0])
        non_G_at_non_G = non_G_at_non_G - 12'((12'd3 * 12'(pixel_window[2][0])) / 12'd2);
    if (pixel_enable_matrix[2][4])
        non_G_at_non_G = non_G_at_non_G - 12'((12'd3 * 12'(pixel_window[2][4])) / 12'd2);


    non_G_at_non_G_count *= 5'd2; // Scaling up to accomodate 0.5
    if (3'(pixel_enable_matrix[0][2]) + 3'(pixel_enable_matrix[4][2]) + 3'(pixel_enable_matrix[2][0]) + 3'(pixel_enable_matrix[2][4]) == 3'd4)
        non_G_at_non_G_count = non_G_at_non_G_count - 5'd12;
    else if (3'(pixel_enable_matrix[0][2]) + 3'(pixel_enable_matrix[4][2]) + 3'(pixel_enable_matrix[2][0]) + 3'(pixel_enable_matrix[2][4]) == 3'd3)
        non_G_at_non_G_count = non_G_at_non_G_count - 5'd9;
    else if (3'(pixel_enable_matrix[0][2]) + 3'(pixel_enable_matrix[4][2]) + 3'(pixel_enable_matrix[2][0]) + 3'(pixel_enable_matrix[2][4]) == 3'd2)
        non_G_at_non_G_count = non_G_at_non_G_count - 5'd6;
    else if (3'(pixel_enable_matrix[0][2]) + 3'(pixel_enable_matrix[4][2]) + 3'(pixel_enable_matrix[2][0]) + 3'(pixel_enable_matrix[2][4]) == 3'd1)
        non_G_at_non_G_count = non_G_at_non_G_count - 5'd3;

    non_G_at_non_G = 12'((13'd2 * 13'(non_G_at_non_G)) / non_G_at_non_G_count);
end


always_comb
begin
    G_at_non_G = 12'd4 * 12'(pixel_window[2][2]);
    G_at_non_G_count = 4'd4;

    if (pixel_enable_matrix[1][2])
    begin
        G_at_non_G = G_at_non_G + 12'(12'd2 * 12'(pixel_window[1][2]));
        G_at_non_G_count = G_at_non_G_count + 4'd2;
    end
    if (pixel_enable_matrix[2][1])
    begin
        G_at_non_G = G_at_non_G + 12'(12'd2 * 12'(pixel_window[2][1]));
        G_at_non_G_count = G_at_non_G_count + 4'd2;
    end
    if (pixel_enable_matrix[2][3])
    begin
        G_at_non_G = G_at_non_G + 12'(12'd2 * 12'(pixel_window[2][3]));
        G_at_non_G_count = G_at_non_G_count + 4'd2;
    end
    if (pixel_enable_matrix[3][2])
    begin
        G_at_non_G = G_at_non_G + 12'(12'd2 * 12'(pixel_window[3][2]));
        G_at_non_G_count = G_at_non_G_count + 4'd2;
    end
    if (pixel_enable_matrix[0][2])
    begin
        G_at_non_G = G_at_non_G - 12'(pixel_window[0][2]);
        G_at_non_G_count = G_at_non_G_count - 4'd1;
    end
    if (pixel_enable_matrix[2][0])
    begin
        G_at_non_G = G_at_non_G - 12'(pixel_window[2][0]);
        G_at_non_G_count = G_at_non_G_count - 4'd1;
    end
    if (pixel_enable_matrix[2][4])
    begin
        G_at_non_G = G_at_non_G - 12'(pixel_window[2][4]);
        G_at_non_G_count = G_at_non_G_count - 4'd1;
    end
    if (pixel_enable_matrix[4][2])
    begin
        G_at_non_G = G_at_non_G - 12'(pixel_window[4][2]);
        G_at_non_G_count = G_at_non_G_count - 4'd1;
    end

    G_at_non_G = G_at_non_G/G_at_non_G_count;
end


always_comb
begin
    non_G_at_same_G_row = 12'd5 * 12'(pixel_window[2][2]);
    non_G_at_same_G_row_count = 4'd5;
    
    if (pixel_enable_matrix[2][1])
    begin
        non_G_at_same_G_row = non_G_at_same_G_row + 12'(12'd4 * 12'(pixel_window[2][1]));
        non_G_at_same_G_row_count =  non_G_at_same_G_row_count + 4'd4;
    end
    if (pixel_enable_matrix[2][3])
    begin
        non_G_at_same_G_row = non_G_at_same_G_row + 12'(12'd4 * 12'(pixel_window[2][3]));
        non_G_at_same_G_row_count =  non_G_at_same_G_row_count + 4'd4;
    end

    if (pixel_enable_matrix[2][0])
    begin
        non_G_at_same_G_row = non_G_at_same_G_row - 12'(12'(pixel_window[2][0]));
        non_G_at_same_G_row_count =  non_G_at_same_G_row_count - 4'd1;
    end
    if (pixel_enable_matrix[2][4])
    begin
        non_G_at_same_G_row = non_G_at_same_G_row - 12'(12'(pixel_window[2][4]));
        non_G_at_same_G_row_count =  non_G_at_same_G_row_count - 4'd1;
    end

    if (pixel_enable_matrix[1][1])
    begin
        non_G_at_same_G_row = non_G_at_same_G_row - 12'(12'(pixel_window[1][1]));
        non_G_at_same_G_row_count =  non_G_at_same_G_row_count - 4'd1;
    end
    if (pixel_enable_matrix[1][3])
    begin
        non_G_at_same_G_row = non_G_at_same_G_row - 12'(12'(pixel_window[1][3]));
        non_G_at_same_G_row_count =  non_G_at_same_G_row_count - 4'd1;
    end
    if (pixel_enable_matrix[3][3])
    begin
        non_G_at_same_G_row = non_G_at_same_G_row - 12'(12'(pixel_window[3][3]));
        non_G_at_same_G_row_count =  non_G_at_same_G_row_count - 4'd1;
    end
    if (pixel_enable_matrix[3][1])
    begin
        non_G_at_same_G_row = non_G_at_same_G_row - 12'(12'(pixel_window[3][1]));
        non_G_at_same_G_row_count =  non_G_at_same_G_row_count - 4'd1;
    end

    non_G_at_same_G_row_count =  non_G_at_same_G_row_count * 5'd2; // scaling up to accomodate 0.5
    if (pixel_enable_matrix[0][2] && pixel_enable_matrix[4][2]) // prevents a bit loss that would occur otherwise
    begin
        non_G_at_same_G_row = non_G_at_same_G_row + 12'((12'(pixel_window[0][2]) + 12'(pixel_window[4][2])) / 12'd2);
        non_G_at_same_G_row_count =  non_G_at_same_G_row_count + 5'd2;
    end
    else if (pixel_enable_matrix[0][2])
    begin
        non_G_at_same_G_row = non_G_at_same_G_row + 12'(12'(pixel_window[0][2]) / 12'd2);
        non_G_at_same_G_row_count =  non_G_at_same_G_row_count + 5'd1;
    end
    else if (pixel_enable_matrix[4][2])
    begin
        non_G_at_same_G_row = non_G_at_same_G_row + 12'(12'(pixel_window[4][2]) / 12'd2);
        non_G_at_same_G_row_count = non_G_at_same_G_row_count + 5'd1;
    end

    non_G_at_same_G_row = 12'((13'd2 * 13'(non_G_at_same_G_row)) / non_G_at_same_G_row_count);
end


always_comb
begin
    non_G_at_diff_G_row = 12'd5 * 12'(pixel_window[2][2]);
    non_G_at_diff_G_row_count = 4'd5;

    if (pixel_enable_matrix[1][2])
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row + 12'(12'd4 * 12'(pixel_window[1][2]));
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count + 4'd4;
    end
    if (pixel_enable_matrix[3][2])
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row + 12'(12'd4 * 12'(pixel_window[3][2]));
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count + 4'd4;
    end

    if (pixel_enable_matrix[0][2])
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row - 12'(pixel_window[0][2]);
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count - 4'd1;
    end
    if (pixel_enable_matrix[4][2])
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row - 12'(pixel_window[4][2]);
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count - 4'd1;
    end

    if (pixel_enable_matrix[1][1])
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row - 12'(pixel_window[1][1]);
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count - 4'd1;
    end
    if (pixel_enable_matrix[1][3])
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row - 12'(pixel_window[1][3]);
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count - 4'd1;
    end
    if (pixel_enable_matrix[3][3])
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row - 12'(pixel_window[3][3]);
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count - 4'd1;
    end
    if (pixel_enable_matrix[3][1])
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row - 12'(pixel_window[3][1]);
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count - 4'd1;
    end

    non_G_at_diff_G_row_count = non_G_at_diff_G_row_count * 5'd2; // scaling up to accomodate 0.5
    if (pixel_enable_matrix[2][0] && pixel_enable_matrix[2][4]) // prevents a bit loss that would occur otherwise
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row + 12'((12'(pixel_window[2][0]) + 12'(pixel_window[2][4])) / 12'd2);
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count + 5'd2;
    end
    else if (pixel_enable_matrix[2][0])
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row + 12'(12'(pixel_window[0][2]) / 12'd2);
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count + 5'd1;
    end
    else if (pixel_enable_matrix[2][4])
    begin
        non_G_at_diff_G_row = non_G_at_diff_G_row + 12'(12'(pixel_window[4][2]) / 12'd2);
        non_G_at_diff_G_row_count = non_G_at_diff_G_row_count + 5'd1;
    end

    non_G_at_diff_G_row = 12'((13'd2 * 13'(non_G_at_diff_G_row)) / non_G_at_diff_G_row_count);
end



always_comb
begin
    case (bayer_center_pixel)
        2'b11: // Red
        begin
            final_rgb_pixel[23:16] = pixel_window[2][2];
            final_rgb_pixel[15:8] = 8'(G_at_non_G);
            final_rgb_pixel[7:0] = 8'(non_G_at_non_G);
        end
        2'b10: // Green in red row
        begin
            final_rgb_pixel[23:16] = 8'(non_G_at_same_G_row);
            final_rgb_pixel[15:8] = pixel_window[2][2];
            final_rgb_pixel[7:0] = 8'(non_G_at_diff_G_row);
        end
        2'b01: // Green in blue row
        begin
            final_rgb_pixel[23:16] = 8'(non_G_at_diff_G_row);
            final_rgb_pixel[15:8] = pixel_window[2][2];
            final_rgb_pixel[7:0] = 8'(non_G_at_same_G_row);
        end
        2'b00: // Blue
        begin
            final_rgb_pixel[23:16] = 8'(non_G_at_non_G);
            final_rgb_pixel[15:8] = 8'(G_at_non_G);
            final_rgb_pixel[7:0] = pixel_window[2][2];
        end
        default:
            final_rgb_pixel = 24'dx;
    endcase
end

endmodule

