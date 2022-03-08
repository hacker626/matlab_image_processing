function varargout = image_processing(varargin)
% IMAGE_PROCESSING MATLAB code for image_processing.fig
%      IMAGE_PROCESSING, by itself, creates a new IMAGE_PROCESSING or raises the existing
%      singleton*.
%
%      H = IMAGE_PROCESSING returns the handle to a new IMAGE_PROCESSING or the handle to
%      the existing singleton*.
%
%      IMAGE_PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_PROCESSING.M with the given input arguments.
%
%      IMAGE_PROCESSING('Property','Value',...) creates a new IMAGE_PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before image_processing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to image_processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help image_processing

% Last Modified by GUIDE v2.5 27-Sep-2021 16:26:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @image_processing_OpeningFcn, ...
                   'gui_OutputFcn',  @image_processing_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before image_processing is made visible.
function image_processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to image_processing (see VARARGIN)

% Choose default command line output for image_processing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes image_processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = image_processing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in import_image.
function import_image_Callback(hObject, eventdata, handles)
a = uigetfile({'*.jpg'},"Insert Image")
filename = a;
setappdata(0,'filname',filename);
a = imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)
setappdata(0,'filename',a);
plot(handles.axes1,'a')

function gray_button_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
a_gray = rgb2gray(a);
setappdata(0,'filename',a_gray);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'Imrotation',a_gray)


function black_white_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
a_bw = im2bw(a,0.57);
axes(handles.axes2);
imshow(a_bw)
setappdata(0,'filename',a_bw);
setappdata(0,'Imrotation',a_bw)

function reset_button_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
imshow(a);
setappdata(0,'a',a);
setappdata(0,'filename',a);
setappdata(0,'Imrotation',a);
axes(handles.axes2);
imshow(a)

function exit_button_Callback(hObject, eventdata, handles)
msgbox('Thanks for using IMAGE Processing');
pause(1);
close();
close();







% --- Executes on button press in histogram_button.
function histogram_button_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0,'a');
input = a;
input = rgb2gray(input);
axes(handles.axes2);
imhist(input)





% --- Executes on button press in red_button.
function red_button_Callback(hObject, eventdata, handles)
% hObject    handle to red_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0,'a');
red = a;
red(:,:,2:3) = 0;
setappdata(0,'filename',red);
setappdata(0,'Imrotation',red);
axes(handles.axes2);
imshow(red)




% --- Executes on button press in green_button.
function green_button_Callback(hObject, eventdata, handles)
% hObject    handle to green_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0,'a');
green = a;
green(:,:,1) = 0;
green(:,:,3) = 0;
setappdata(0,'filename',green);
setappdata(0,'Imrotation',green);
axes(handles.axes2);
imshow(green)


% --- Executes on button press in blue_button.
function blue_button_Callback(hObject, eventdata, handles)
% hObject    handle to blue_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0,'a');
blue = a;
blue(:,:,1) = 0;
blue(:,:,2) = 0;
setappdata(0,'filename',blue);
setappdata(0,'Imrotation',blue);
axes(handles.axes2);
imshow(blue)



% --- Executes on button press in anti_clockwise_button.
function anti_clockwise_button_Callback(hObject, eventdata, handles)
% hObject    handle to anti_clockwise_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Imrotation = getappdata(0,'Imrotation');
ImrotateAnticlockwise = imrotate(Imrotation,-90);
setappdata(0,'Imrotation',ImrotateAnticlockwise);
axes(handles.axes2);
imshow(ImrotateAnticlockwise)







% --- Executes on button press in clockwise_button.
function clockwise_button_Callback(hObject, eventdata, handles)
% hObject    handle to clockwise_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Imrotation = getappdata(0,'Imrotation');
Imrotateclockwise = imrotate(Imrotation,90);
setappdata(0,'Imrotation',Imrotateclockwise);
axes(handles.axes2);
imshow(Imrotateclockwise)


% --- Executes on button press in rotate_180.
function rotate_180_Callback(hObject, eventdata, handles)
% hObject    handle to rotate_180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Imrotation = getappdata(0,'Imrotation');
Imrotate_180 = imrotate(Imrotation,180);
setappdata(0,'Imrotation',Imrotate_180);
axes(handles.axes2);
imshow(Imrotate_180)






% --- Executes on button press in flip_horizontal_button.
function flip_horizontal_button_Callback(hObject, eventdata, handles)
% hObject    handle to flip_horizontal_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(0,'Imrotation');
I2 = flip(I,2);
setappdata(0,'Imrotation',I2)
axes(handles.axes2);
imshow(I2);

% --- Executes on button press in flip_vertical_button.
function flip_vertical_button_Callback(hObject, eventdata, handles)
% hObject    handle to flip_horizontal_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(0,'Imrotation');
I1 = flip(I,1);
setappdata(0,'Imrotation',I1)
axes(handles.axes2);
imshow(I1);





% --- Executes on button press in horizontal_vertical_button.
function horizontal_vertical_button_Callback(hObject, eventdata, handles)
% hObject    handle to horizontal_vertical_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(0,'Imrotation');
I2 = flip(I,2);
I3 = flip(I,1);
I4 = flip(I3,2)
setappdata(0,'Imrotation',I4)
axes(handles.axes2);
imshow(I4);


% --- Executes on button press in dilation_button.
function dilation_button_Callback(hObject, eventdata, handles)
% hObject    handle to dilation_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dilation_img = getappdata(0,'a')
dilation_img = im2bw(dilation_img,0.57);
[r c] = size(dilation_img);
w = ones(3,3);
output = [];
for x = 2:1:r-1
    for y = 2:1:c-1
         g = [w(1)*dilation_img(x-1,y-1) w(2)*dilation_img(x-1,y) w(3)*dilation_img(x-1,y+1)...
             w(4)*dilation_img(x,y-1) w(5)*dilation_img(x,y) w(6)*dilation_img(x,y+1)...
             w(7)*dilation_img(x+1,y-1) w(8)*dilation_img(x+1,y) w(9)*dilation_img(x+1,y+1)];
         output(x,y) = max(g);
    end;
end;

setappdata(0,'filename',output);
setappdata(0,'Imrotation',output);
axes(handles.axes2);
imshow(output);



% --- Executes on button press in erosion_button.
function erosion_button_Callback(hObject, eventdata, handles)
% hObject    handle to erosion_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
erosion_img = getappdata(0,'a')
erosion_img = im2bw(erosion_img,0.57);
[r c] = size(erosion_img);
w = ones(3,3);
output = [];
for x = 2:1:r-1
    for y = 2:1:c-1
         g = [w(1)*erosion_img(x-1,y-1) w(2)*erosion_img(x-1,y) w(3)*erosion_img(x-1,y+1)...
             w(4)*erosion_img(x,y-1) w(5)*erosion_img(x,y) w(6)*erosion_img(x,y+1)...
             w(7)*erosion_img(x+1,y-1) w(8)*erosion_img(x+1,y) w(9)*erosion_img(x+1,y+1)];
         output(x,y) = min(g);
    end;
end;
setappdata(0,'filename',output);
setappdata(0,'Imrotation',output);
axes(handles.axes2);
imshow(output);