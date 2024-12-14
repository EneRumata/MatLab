function varargout = LAB1(varargin)
% LAB1 MATLAB code for LAB1.fig
%      LAB1, by itself, creates a new LAB1 or raises the existing
%      singleton*.
%
%      H = LAB1 returns the handle to a new LAB1 or the handle to
%      the existing singleton*.
%
%      LAB1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB1.M with the given input arguments.
%
%      LAB1('Property','Value',...) creates a new LAB1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LAB1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LAB1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LAB1

% Last Modified by GUIDE v2.5 03-May-2022 22:12:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LAB1_OpeningFcn, ...
                   'gui_OutputFcn',  @LAB1_OutputFcn, ...
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


% --- Executes just before LAB1 is made visible.
function LAB1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LAB1 (see VARARGIN)

% Choose default command line output for LAB1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LAB1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LAB1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function createAxes(hObject, eventdata, handles)
set(handles.Menu2,'enable','on')
set(handles.Menu3,'enable','on')
set(handles.Menu4,'enable','on')
set(handles.CMenu2,'enable','on')
set(handles.CMenu3,'enable','on')
set(handles.CMenu4,'enable','on')

x=-5:0.1:5;
y=x.^2;

if get(handles.CBred,'enable') == 'off'
    color='r';
else
    color='b';
end
if get(handles.CBmarker0,'enable') == 'off'
    marker='none';
else
    if get(handles.CBmarker1,'enable') == 'off'
        marker='s';
    else
        marker='o';
    end
end

if get(handles.CBbold0,'enable') == 'off'
    markerSize=1;
else
    if get(handles.CBbold1,'enable') == 'off'
        markerSize=2;
    else
        if get(handles.CBbold2,'enable') == 'off'
            markerSize=5;
        else
            markerSize=10;
        end
    end
end

oldx = x0:xn:x1;
oldy = y0:yn:y1;
[x,y] = meshgrid(oldx,oldy);
f = str2func(strcat('@(x,y)',get(handles.inputFunc,'String')));
z = f(x,y);
mesh(x,y,z)


rotate3d on
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');

plot(x,y,'Color',color,'Marker',marker,'LineWidth',markerSize,'MarkerSize',markerSize*3);

% --- Executes on button press in pushbutton2.
function pushbutton1_Callback(hObject, eventdata, handles)
createAxes(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
close all;
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu1Sub1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CBred_Callback(hObject, eventdata, handles)
set(handles.CBred,'enable','off')
set(handles.CBblue,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMxlabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CBblue_Callback(hObject, eventdata, handles)
set(handles.CBred,'enable','on')
set(handles.CBblue,'enable','off')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMylabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function cmColor_Callback(hObject, eventdata, handles)
% hObject    handle to cmColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu3_Callback(hObject, eventdata, handles)
% hObject    handle to Menu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CBmarker0_Callback(hObject, eventdata, handles)
set(handles.CBmarker0,'enable','off')
set(handles.CBmarker1,'enable','on')
set(handles.CBmarker2,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMmarker0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CBmarker1_Callback(hObject, eventdata, handles)
set(handles.CBmarker0,'enable','on')
set(handles.CBmarker1,'enable','off')
set(handles.CBmarker2,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMmarker1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CBmarker2_Callback(hObject, eventdata, handles)
set(handles.CBmarker0,'enable','on')
set(handles.CBmarker1,'enable','on')
set(handles.CBmarker2,'enable','off')
createAxes(hObject, eventdata, handles)
% hObject    handle to CBmarker2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMxlabel_Callback(hObject, eventdata, handles)
if get(gca,'xgrid') == 'off'
    set(gca,'xgrid','on')
else
    set(gca,'xgrid','off')
end
% hObject    handle to CMxlabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMylabel_Callback(hObject, eventdata, handles)
if get(gca,'ygrid') == 'off'
    set(gca,'ygrid','on')
else
    set(gca,'ygrid','off')
end
% hObject    handle to CMylabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu4_Callback(hObject, eventdata, handles)
% hObject    handle to Menu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CBbold0_Callback(hObject, eventdata, handles)
set(handles.CBbold0,'enable','off')
set(handles.CBbold1,'enable','on')
set(handles.CBbold2,'enable','on')
set(handles.CBbold3,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMbold0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CBbold1_Callback(hObject, eventdata, handles)
set(handles.CBbold0,'enable','on')
set(handles.CBbold1,'enable','off')
set(handles.CBbold2,'enable','on')
set(handles.CBbold3,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMbold1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CBbold2_Callback(hObject, eventdata, handles)
set(handles.CBbold0,'enable','on')
set(handles.CBbold1,'enable','on')
set(handles.CBbold2,'enable','off')
set(handles.CBbold3,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CBbold2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CBbold3_Callback(hObject, eventdata, handles)
set(handles.CBbold0,'enable','on')
set(handles.CBbold1,'enable','on')
set(handles.CBbold2,'enable','on')
set(handles.CBbold3,'enable','off')
createAxes(hObject, eventdata, handles)
% hObject    handle to CBbold3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function pbt_clear_Callback(hObject, eventdata, handles)
cla;

set(handles.Menu2,'enable','off')
set(handles.Menu3,'enable','off')
set(handles.Menu4,'enable','off')
set(handles.CMenu2,'enable','off')
set(handles.CMenu3,'enable','off')
set(handles.CMenu4,'enable','off')

set(handles.CBred,'enable','on')
set(handles.CBblue,'enable','off')

set(handles.CBmarker0,'enable','off')
set(handles.CBmarker1,'enable','on')
set(handles.CBmarker2,'enable','on')

set(handles.CBbold0,'enable','off')
set(handles.CBbold1,'enable','on')
set(handles.CBbold2,'enable','on')
set(handles.CBbold3,'enable','on')
% hObject    handle to pbt_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMred_Callback(hObject, eventdata, handles)
set(handles.CBred,'enable','off')
set(handles.CBblue,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMxlabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMblue_Callback(hObject, eventdata, handles)
set(handles.CBred,'enable','on')
set(handles.CBblue,'enable','off')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMylabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMmarker0_Callback(hObject, eventdata, handles)
set(handles.CBmarker0,'enable','off')
set(handles.CBmarker1,'enable','on')
set(handles.CBmarker2,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMmarker0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMmarker1_Callback(hObject, eventdata, handles)
set(handles.CBmarker0,'enable','on')
set(handles.CBmarker1,'enable','off')
set(handles.CBmarker2,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMmarker1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMmarker2_Callback(hObject, eventdata, handles)
set(handles.CBmarker0,'enable','on')
set(handles.CBmarker1,'enable','on')
set(handles.CBmarker2,'enable','off')
createAxes(hObject, eventdata, handles)
% hObject    handle to CBmarker2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMbold0_Callback(hObject, eventdata, handles)
set(handles.CBbold0,'enable','off')
set(handles.CBbold1,'enable','on')
set(handles.CBbold2,'enable','on')
set(handles.CBbold3,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMbold0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMbold1_Callback(hObject, eventdata, handles)
set(handles.CBbold0,'enable','on')
set(handles.CBbold1,'enable','off')
set(handles.CBbold2,'enable','on')
set(handles.CBbold3,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CMbold1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMbold2_Callback(hObject, eventdata, handles)
set(handles.CBbold0,'enable','on')
set(handles.CBbold1,'enable','on')
set(handles.CBbold2,'enable','off')
set(handles.CBbold3,'enable','on')
createAxes(hObject, eventdata, handles)
% hObject    handle to CBbold2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CMbold3_Callback(hObject, eventdata, handles)
set(handles.CBbold0,'enable','on')
set(handles.CBbold1,'enable','on')
set(handles.CBbold2,'enable','on')
set(handles.CBbold3,'enable','off')
createAxes(hObject, eventdata, handles)
% hObject    handle to CBbold3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function CMenu2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function CMenu3_Callback(hObject, eventdata, handles)
% hObject    handle to Menu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function CMenu4_Callback(hObject, eventdata, handles)
% hObject    handle to Menu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit as text
%        str2double(get(hObject,'String')) returns contents of edit as a double


% --- Executes during object creation, after setting all properties.
function edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
