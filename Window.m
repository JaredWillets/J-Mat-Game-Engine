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
            self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 1) = self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 1) + object.pixels(:,:,1) .* object.transparency(:,:);
            self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 2) = self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 2) + object.pixels(:,:,2) .* object.transparency(:,:);
            self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 3) = self.pixels(position(1):position(1)+object.width-1, position(2):position(2)+object.height-1, 3) + object.pixels(:,:,3) .* object.transparency(:,:);
            this = self;
        end
        function render(self)
            temp = flip(imrotate(self.pixels,90,'bilinear','loose'),1);
            imshow(uint8(temp(:,:,1:3)));
        end
        function this = drawLine(self, x1, y1, x2, y2, color)
            mode = 1;
            if min(x1, x2) == x2
                mode = 2;
            end
            if mode == 1
                m = (y2-y1)/(x2-x1);
                for x = 0:x2-x1
                    
                    self.pixels(x1+x+1,uint32(x*m)+1,1:3) = color(1:3);
                end
            elseif mode == 2
                m = (y1-y2)/(x1-x2);
                for x = 0:x1-x2
                    self.pixels(x2+x+1,uint32(x*m)+1,1:3) = color(1:3);
                end
            end

            this = self;
            
        end
        function this = clear(self)
            self.pixels = zeros(self.resolution);
            this = self;
        end
    end
end

