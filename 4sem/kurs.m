function varargout = project(varargin)
% PROJECT MATLAB code for project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 29-Dec-2021 07:38:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
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


% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project (see VARARGIN)

% Choose default command line output for project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbt1.
function pbt1_Callback(hObject, eventdata, handles)
% hObject    handle to pbt1 (see GCBO)
x0=str2double(get(handles.input1,'String'));
xn=str2double(get(handles.input2,'String'));
x1=str2double(get(handles.input3,'String'));
y0=str2double(get(handles.input4,'String'));
yn=str2double(get(handles.input5,'String'));
y1=str2double(get(handles.input6,'String'));
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


set(handles.pbt2,'enable','on')
set(handles.pbt3,'enable','on')
set(handles.pbt4,'enable','on')
set(handles.pbt5,'enable','on')
set(handles.pbt_clear,'enable','on')

set(handles.input1,'enable','off')
set(handles.input2,'enable','off')
set(handles.input3,'enable','off')
set(handles.input4,'enable','off')
set(handles.input5,'enable','off')
set(handles.input6,'enable','off')
set(handles.inputFunc,'enable','off')
% set(hObject,'enable','off')
% set(handles.pbt1,'enable','off')
set(gco,'enable','off')

guidata(gcbo,handles);

if get(handles.chbx,'value')
    set(gca,'xgrid','on')
else
    set(gca,'xgrid','off')
end
if get(handles.chby,'value')
    set(gca,'ygrid','on')
else
    set(gca,'ygrid','off')
end
if get(handles.chbz,'value')
    set(gca,'zgrid','on')
else
    set(gca,'zgrid','off')
end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbt_clear.
function pbt_clear_Callback(hObject, eventdata, handles)
% hObject    handle to pbt_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
set(handles.txt1,'String','0')
set(handles.txt2,'String','0')
	
set(handles.pbt_clear,'enable','off')
set(handles.pbt1,'enable','on')
set(handles.pbt2,'enable','off')
set(handles.pbt3,'enable','off')
set(handles.pbt4,'enable','off')
set(handles.pbt5,'enable','off')

set(handles.input1,'enable','on')
set(handles.input2,'enable','on')
set(handles.input3,'enable','on')
set(handles.input4,'enable','on')
set(handles.input5,'enable','on')
set(handles.input6,'enable','on')
set(handles.inputFunc,'enable','on')

% --- Executes on button press in chbx.
function chbx_Callback(hObject, eventdata, handles)
if get(gco,'value')
    set(gca,'xgrid','on')
else
    set(gca,'xgrid','off')
end
% hObject    handle to chbx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chbx


% --- Executes on button press in chby.
function chby_Callback(hObject, eventdata, handles)
if get(gco,'value')
    set(gca,'ygrid','on')
else
    set(gca,'ygrid','off')
end
% hObject    handle to chby (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chby


% --- Executes on button press in pbt_close.
function pbt_close_Callback(hObject, eventdata, handles)
close all;
% hObject    handle to pbt_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function inputFunc_Callback(hObject, eventdata, handles)
% hObject    handle to inputFunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputFunc as text
%        str2double(get(hObject,'String')) returns contents of inputFunc as a double


% --- Executes during object creation, after setting all properties.
function inputFunc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputFunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double


% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double


% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input3_Callback(hObject, eventdata, handles)
% hObject    handle to input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input3 as text
%        str2double(get(hObject,'String')) returns contents of input3 as a double


% --- Executes during object creation, after setting all properties.
function input3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input5_Callback(hObject, eventdata, handles)
% hObject    handle to input5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input5 as text
%        str2double(get(hObject,'String')) returns contents of input5 as a double


% --- Executes during object creation, after setting all properties.
function input5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input4_Callback(hObject, eventdata, handles)
% hObject    handle to input4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input4 as text
%        str2double(get(hObject,'String')) returns contents of input4 as a double


% --- Executes during object creation, after setting all properties.
function input4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input6_Callback(hObject, eventdata, handles)
% hObject    handle to input6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input6 as text
%        str2double(get(hObject,'String')) returns contents of input6 as a double


% --- Executes during object creation, after setting all properties.
function input6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in chbz.
function chbz_Callback(hObject, eventdata, handles)
if get(gco,'value')
    set(gca,'zgrid','on')
else
    set(gca,'zgrid','off')
end
% hObject    handle to chbz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chbz


% --- Executes on button press in pbt2.
function pbt2_Callback(hObject, eventdata, handles)

set(handles.pbt2,'enable','off')

x0=str2double(get(handles.input1,'String'));
xn=str2double(get(handles.input2,'String'));
x1=str2double(get(handles.input3,'String'));
y0=str2double(get(handles.input4,'String'));
yn=str2double(get(handles.input5,'String'));
y1=str2double(get(handles.input6,'String'));
oldx = x0:xn:x1;
oldy = y0:yn:y1;
[x,y] = meshgrid(oldx,oldy);
f = str2func(strcat('@(x,y)',get(handles.inputFunc,'String')));
z = f(x,y);

m=min(min(z));
set(handles.txt2,'String',m);
[i,j] = size(z);
q=[];

for a=1:i
    for b=1:j
        if z(a,b)==m
            q = [q;[a b]];
        end
    end
end


hold on
a=size(q,1);

for i=1:a
    b = [q(i,1) q(i,2)];
    plot3(x(b(1),b(2)),y(b(1),b(2)),z(b(1),b(2)),'h','color','red');
end

% hObject    handle to pbt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbt3.
function pbt3_Callback(hObject, eventdata, handles)

set(handles.pbt3,'enable','off')

x0=str2double(get(handles.input1,'String'));
xn=str2double(get(handles.input2,'String'));
x1=str2double(get(handles.input3,'String'));
y0=str2double(get(handles.input4,'String'));
yn=str2double(get(handles.input5,'String'));
y1=str2double(get(handles.input6,'String'));
oldx = x0:xn:x1;
oldy = y0:yn:y1;
[x,y] = meshgrid(oldx,oldy);
f = str2func(strcat('@(x,y)',get(handles.inputFunc,'String')));
z = f(x,y);
z0 = -z;

m=min(min(z0));
set(handles.txt1,'String',m);
[i,j] = size(z0);
q=[];

for a=1:i
    for b=1:j
        if z0(a,b)==m
            q = [q;[a b]];
        end
    end
end


hold on
a=size(q,1);

for i=1:a
    b = [q(i,1) q(i,2)];
    plot3(x(b(1),b(2)),y(b(1),b(2)),z(b(1),b(2)),'h','color','blue');
end


% hObject    handle to pbt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbt4.
function pbt4_Callback(hObject, eventdata, handles)

set(handles.pbt4,'enable','off')

x0=str2double(get(handles.input1,'String'));
xn=str2double(get(handles.input2,'String'));
x1=str2double(get(handles.input3,'String'));
y0=str2double(get(handles.input4,'String'));
yn=str2double(get(handles.input5,'String'));
y1=str2double(get(handles.input6,'String'));
oldx = x0:xn:x1;
oldy = y0:yn:y1;
[x,y] = meshgrid(oldx,oldy);
f = str2func(strcat('@(x,y)',get(handles.inputFunc,'String')));
z = f(x,y);

if get(handles.inputFunc,'String')=='1'
    
    z0 = -z;
    zeromatr = [];

    [i,j] = size(z);
    for a=1:i
        for b=1:j

            k = z0(a,b);
            bool = 0;
            for m=-1:1
                if bool==0
                for n=-1:1

                    if bool==0
                    if a+m>0 && b+n>0 && a+m<=i && b+n<=j
                        if z0(a+m,b+n) < k
                            bool = 1;
                        end
                    end
                    end

                end
                end
            end
            if bool == 0
                zeromatr = [zeromatr;[a b]];
            end

        end
    end
    
else
    
    xzeros = [];
    yzeros = [];

    [i,j] = size(z);
    for a=1:i
        for b=1:j

            if b==1
                if z(a,1)>z(a,2)
                    xzeros = [xzeros;[a 1]];
                end
                elseif b==j
                if z(a,j)>z(a,j-1)
                    xzeros = [xzeros;[a j]];
                end
            else
                if z(a,b)>z(a,b-1) && z(a,b)>z(a,b+1)
                    xzeros = [xzeros;[a b]];
                end
            end

            for c=1:i

                if c==1
                    if z(1,b)>z(2,b)
                        yzeros = [yzeros;[1 b]];
                    end
                elseif c==i
                    if z(i,b)>z(i-1,b)
                        yzeros = [yzeros;[i b]];
                    end
                else
                    if z(c,b)>z(c-1,b) && z(c,b)>z(c+1,b)
                        yzeros = [yzeros;[c b]];
                    end
                end

            end
        end
    end

    zeromatr = [];
    i = size(xzeros,1);
    j = size(yzeros,1);
    for a=1:i
        for b=1:j
            if xzeros(a,1) == yzeros(b,1) && yzeros(b,2) == xzeros(a,2)
                zeromatr = [zeromatr;[xzeros(a,1) xzeros(a,2)]];
            end
        end
    end
    
end

hold on
a=size(zeromatr,1);

for i=1:a
    b = [zeromatr(i,1) zeromatr(i,2)];
    plot3(x(b(1),b(2)),y(b(1),b(2)),z(b(1),b(2)),'.','color','blue');
end

% hObject    handle to pbt4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbt5.
function pbt5_Callback(hObject, eventdata, handles)

set(handles.pbt5,'enable','off')

x0=str2double(get(handles.input1,'String'));
xn=str2double(get(handles.input2,'String'));
x1=str2double(get(handles.input3,'String'));
y0=str2double(get(handles.input4,'String'));
yn=str2double(get(handles.input5,'String'));
y1=str2double(get(handles.input6,'String'));
oldx = x0:xn:x1;
oldy = y0:yn:y1;
[x,y] = meshgrid(oldx,oldy);
f = str2func(strcat('@(x,y)',get(handles.inputFunc,'String')));
z = f(x,y);

if get(handles.inputFunc,'String')=='1'
    
    zeromatr = [];

    [i,j] = size(z);
    for a=1:i
        for b=1:j

            k = z(a,b);
            bool = 0;
            for m=-1:1
                if bool==0
                for n=-1:1

                    if bool==0
                    if a+m>0 && b+n>0 && a+m<=i && b+n<=j
                        if z(a+m,b+n) < k
                            bool = 1;
                        end
                    end
                    end

                end
                end
            end
            if bool == 0
                zeromatr = [zeromatr;[a b]];
            end

        end
    end
    
else
    
    xzeros = [];
    yzeros = [];

    [i,j] = size(z);
    for a=1:i
        for b=1:j

            if b==1
                if z(a,1)<z(a,2)
                    xzeros = [xzeros;[a 1]];
                end
                elseif b==j
                if z(a,j)<z(a,j-1)
                    xzeros = [xzeros;[a j]];
                end
            else
                if z(a,b)<z(a,b-1) && z(a,b)<z(a,b+1)
                    xzeros = [xzeros;[a b]];
                end
            end

            for c=1:i

                if c==1
                    if z(1,b)<z(2,b)
                        yzeros = [yzeros;[1 b]];
                    end
                elseif c==i
                    if z(i,b)<z(i-1,b)
                        yzeros = [yzeros;[i b]];
                    end
                else
                    if z(c,b)<z(c-1,b) && z(c,b)<z(c+1,b)
                        yzeros = [yzeros;[c b]];
                    end
                end

            end
        end
    end

    zeromatr = [];
    i = size(xzeros,1);
    j = size(yzeros,1);
    for a=1:i
        for b=1:j
            if xzeros(a,1) == yzeros(b,1) && yzeros(b,2) == xzeros(a,2)
                zeromatr = [zeromatr;[xzeros(a,1) xzeros(a,2)]];
            end
        end
    end
    
end

hold on
a=size(zeromatr,1);

for i=1:a
    b = [zeromatr(i,1) zeromatr(i,2)];
    plot3(x(b(1),b(2)),y(b(1),b(2)),z(b(1),b(2)),'.','color','red');
end
% hObject    handle to pbt5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
