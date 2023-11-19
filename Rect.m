classdef Rect
    properties
        width = 1
        height = 01
        color = [255 255 255]
        pixels = zeros([1 1 3])
    end
    methods
        function this = init(self, width, height, color)
            self.width = width;
            self.height = height;
            self.color = color;
            self.pixels = zeros([width height 3]);
            self.pixels(:,:,1) = self.pixels(:,:,1)+color(1);
            self.pixels(:,:,2) = self.pixels(:,:,2)+color(2);
            self.pixels(:,:,3) = self.pixels(:,:,3)+color(3);
            this = self;
        end
    end
end