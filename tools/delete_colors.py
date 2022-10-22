#!/usr/bin/env python

import argparse
from pathlib import Path
from PIL import Image

def make_img_colorless(filepath: Path, destination: str):
    orig_image = Image.open(filepath)
    width, height = orig_image.size
    orig_pixel_map = orig_image.load()

    new_image = Image.new(orig_image.mode, (width, height))
    new_pixel_map = new_image.load()

    for x in range(width):
        for y in range(height):
            new_pixel_map[x, y] = orig_pixel_map[x, y]
            min_col = 180
            if new_pixel_map[x, y][0] > min_col or \
               new_pixel_map[x, y][1] > min_col or \
               new_pixel_map[x, y][2] > min_col:
                new_pixel_map[x, y] = (255, 255, 255)
            medium_color = sum(new_pixel_map[x, y]) // 3
            new_pixel_map[x, y] = (medium_color, medium_color, medium_color)

    if filepath.suffix == '.jpg':
        new_image = new_image.convert('RGB')
    new_image.save(destination)


def main(path_to_files: str):
    path = Path(path_to_files)
    if path.is_file():
        make_img_colorless(path, f'{path.parent}/{path.stem}_new{path.suffix}')
    elif path.is_dir():
        new_dir = Path(f'{path}_new')
        new_dir.mkdir(exist_ok=True)
        for file in path.iterdir():
            make_img_colorless(file, f'{new_dir}/{file.name}')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Delete light colors from images')
    parser.add_argument('path_to_files', metavar='P', type=str,
                        help='path to folder or single file')

    args = parser.parse_args()
    main(args.path_to_files)