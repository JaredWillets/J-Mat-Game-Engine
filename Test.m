import Window.*;
import Rect.*;
import Sprite.*;

testRect = Rect;

testRect = testRect.init(200,200,[255,0,0]);

newWindow = Window;

newWindow = newWindow.setResolution([500 500]);

newWindow = newWindow.init();

global running;
running = true;
rectPosition = [50 50];
fig = figure;

set(fig, 'CloseRequestFcn', @closeFunction);
set(fig, 'KeyPressFcn', @keypressFunction);



newWindow = newWindow.clear();
newWindow.render();

s = Sprite();
s = s.init(255,255,"mike.png");



while running
    newWindow = newWindow.clear();
    newWindow = newWindow.blit(testRect, rectPosition);
    newWindow = newWindow.blit(s, rectPosition);
    rectPosition(2) = rectPosition(2)+1;
    newWindow.render();
    
end


function keypressFunction(src, event)
    key = event.Key;
    if strcmp(key, 'q')
        disp('Exiting...');
        close(src);
    end
end

function closeFunction(src,~)
    global running ;
    running = false;
    delete(src);
end