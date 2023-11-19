classdef Window
    properties
        pixels = []
        resolution = [800,600,4]
    end
    methods
        function this = setResolution(self, newresolution) 
            self.resolution = newresolution;
            self.resolution(3) = 4;
            this = self;
        end
        function this = init(self) 
            self.pixels = uint8(zeros(self.resolution));
            this= self;
            
        end
        function this = blit(self, object, position)
            self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 1) = self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 1) + double(object.pixels(:,:,1)); %.* object.pixels(:,:,4);
            self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 2) = self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 2) + double(object.pixels(:,:,2)); %.* object.pixels(:,:,4);
            self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 3) = self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 3) + double(object.pixels(:,:,3)); %.* object.pixels(:,:,4);
            this = self;
        end
        function render(self)
            imshow(uint8(self.pixels(:,:,1:3)));
        end
        function this = clear(self)
            self.pixels = zeros(self.resolution);
            this = self;
        end
    end
end

