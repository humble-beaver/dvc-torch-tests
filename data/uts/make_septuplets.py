"""Create septuplets from datafolder"""

import os
from glob import glob
import shutil
import random

def make_septuplets(impath, dirpath):
    """copy images from impath to dirpath into septuplets subdirs"""
    path_list = glob(f"{impath}/*.png")
    fname_list = [name.split('/')[-1] for name in path_list]
    groups = round(len(path_list) / 7)
    img_iter = iter(fname_list)
    for i in range(groups):
        sept_path = f"{dirpath}/{str(i+1).zfill(4)}"
        print(f"Creating {sept_path} group")
        os.makedirs(sept_path, exist_ok=True)
        for j in range(7):
            im_name = next(img_iter)
            im_src = f"{impath}/{im_name}"
            im_dst = f"{sept_path}/im{j}.png"
            shutil.copyfile(im_src, im_dst)


def make_test_file(dirpath, outpath):
    sept_list = glob(f"{dirpath}/**/*.png", recursive=True)
    sept_set = set()
    list_size = len(sept_list)

    while len(sept_set) != list_size:
        rn = random.randint(0, list_size-1)
        impath = sept_list[rn]
        test_name = impath.split("septuplets/")[-1]
        sept_set.add(test_name)
    
    f = open(f"{outpath}/test.txt", "a")
    for file in sept_set:
        f.write(f"{file}\n")
    f.close()


if __name__ == "__main__":
    impath = "./images/Manifold-1"
    dirpath = "./images/Manifold-1/septuplets/00001"
    # make_septuplets(impath, dirpath)
    make_test_file(dirpath, "./")
