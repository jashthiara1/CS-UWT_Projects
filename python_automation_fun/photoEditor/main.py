# Jasharn Thiara
# 

from PIL import Image, ImageEnhance, ImageFilter
import os 

path = './images'
pathout = '/editedImgs'

#access images and apply filter
for filename in os.listdir(path):
    img = Image.open(f"{path}/{filename}")

    #add sharpen, black and white, and rotate photos
    edit = img.filter(ImageFilter.SHARPEN).convert('L').rotate(-90)
    clean_name = os.path.splitext(filename)[0]

    # factor of contrast to apply
    factor = 1.5
    enhancer =ImageEnhance.Contrast(edit)
    edit = enhancer.enhance(factor)


    edit.save(f'.{pathout}/{clean_name}_edited.jpg')