function [nonzeros, mse] = imgquant(qstep)
%ENSC180 HW3 Q1: image DCT domain quantization

close all;

x = imread('barbara.pgm');
imshow(x);

x = double(x);

[rows, cols] = size(x);
xrec = zeros(rows, cols);

M = 8;
C = dct(eye(M));

nonzeros = 0;
for r = 1 : rows / M
    for c = 1 : cols / M
        ridx = (r - 1) * M + 1 : r * M;
        cidx = (c - 1) * M + 1 : c * M;
        blk = x(ridx, cidx);

        y = C * blk * C';
        yq = round(y / qstep) * qstep;
        nonzeros = nonzeros + sum(sum(yq ~= 0));

        xrec(ridx, cidx) = C' * yq * C;

        if r == 1 && c == 1
            blk
            y
            yq
            xrec(ridx, cidx)
        end

    end
end
s= sprintf('The number of non-zero DCT coefficients is %d', nonzeros);
disp(s);

xrec = round(xrec);
xrec(xrec > 255) = 255;
xrec(xrec < 0) = 0;

err = x - xrec;
mse = sum(sum(err.^2)) / rows / cols;
s= sprintf('The MSE is %f', mse);
disp(s);

xrec = uint8(xrec);
figure;
imshow(xrec);
title('Reconstructed Image');
