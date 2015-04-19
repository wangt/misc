import cv
import sys

print sys.argv
if len(sys.argv) < 3:
    print 'Usage: cmd [input_image]'
    exit()

input_img = sys.argv[1]
output_img = sys.argv[2]

imagen =cv.LoadImage(input_img, cv.CV_LOAD_IMAGE_GRAYSCALE)
image_color = cv.LoadImage(input_img, cv.CV_LOAD_IMAGE_COLOR)

smooth = cv.CreateImage((imagen.width, imagen.height), cv.IPL_DEPTH_8U, 1)
threshold = cv.CreateImage((imagen.width, imagen.height), cv.IPL_DEPTH_8U, 1)
open_morf = cv.CreateImage((imagen.width, imagen.height), cv.IPL_DEPTH_8U, 1)

storage = cv.CreateMemStorage()

cv.Smooth(imagen, smooth, cv.CV_GAUSSIAN, 3, 0, 0, 0)
avg, avgStd = cv.AvgSdv(smooth)
cv.Threshold(smooth, threshold, int(avg[0]) - 7*int(avgStd[0]/8), 255, cv.CV_THRESH_BINARY_INV)
#cv.AdaptiveThreshold(imagen, threshold, 255, param1=5)

#cv.Erode(threshold, open_morf, None, 1)
#cv.Dilate(open_morf, open_morf, None, 1)

open_morf = threshold

img_contornos = cv.CloneImage(open_morf)

contours = cv.FindContours(img_contornos, storage, mode=cv.CV_RETR_EXTERNAL, method=cv.CV_CHAIN_APPROX_SIMPLE, offset=(0,0))

contourLow = cv.ApproxPoly(contours, storage, cv.CV_POLY_APPROX_DP, 1, 1)
contourLow = contours

while contourLow:
    (x, y, w, h) = rect = cv.BoundingRect(contourLow)
    #cv.Rectangle(image_color, (x, y), (x+w, y + h), (123, 0, 0), 1, 8, 0)
    #if h<6 or w<6:
    if w*h<60:
        cv.Rectangle(open_morf, (x, y), (x+w, y + h), (0, 0, 0), -1, 8, 0)
    else:
        pass
        #cv.Rectangle(open_morf, (x, y), (x+w, y + h), (255, 0, 0), 1, 8, 0)
    contourLow = contourLow.h_next()

cv.SaveImage(output_img, open_morf)
