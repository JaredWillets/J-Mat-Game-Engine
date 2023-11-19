classdef Sprite
    properties
        width = 1
        height = 1
        filename = [255 255 255]
        pixels = zeros([1 1 3])
    end
    methods
        function this = init(self, width, height, filename)
            self.width = width;
            self.height = height;
            self.filename = filename;
            image = imread(filename);
            self.pixels = zeros([width height 3]);
            self.pixels = image
            this = self;
        end
    end
end