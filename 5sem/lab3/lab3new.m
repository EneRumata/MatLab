function varargout = lab3new(varargin)
% LAB3NEW MATLAB code for lab3new.fig
%      LAB3NEW, by itself, creates a new LAB3NEW or raises the existing
%      singleton*.
%
%      H = LAB3NEW returns the handle to a new LAB3NEW or the handle to
%      the existing singleton*.
%
%      LAB3NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB3NEW.M with the given input arguments.
%
%      LAB3NEW('Property','Value',...) creates a new LAB3NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab3new_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab3new_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab3new

% Last Modified by GUIDE v2.5 22-Jan-2022 15:20:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab3new_OpeningFcn, ...
                   'gui_OutputFcn',  @lab3new_OutputFcn, ...
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


% --- Executes just before lab3new is made visible.
function lab3new_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab3new (see VARARGIN)

% Choose default command line output for lab3new
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab3new wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab3new_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close all;
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
key=get(handles.text6,'String');
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String','0.');
elseif key(1)=='3'
    if key(2)=='1'
        set(handles.text5,'String',strcat(get(handles.text5,'String'),'.'));
    end
elseif key(1)=='4'
    %nothing
end
set(handles.text6,'String',strcat('4210'));
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
key=get(handles.text6,'String');
b='+';
if key(1)=='1'
    set(handles.text4,'String',strcat(get(handles.text5,'String'),b));
elseif key(1)=='2'
    oldS=get(handles.text4,'String');
    newS='';
    i=1;
    while i < length(oldS)
        newS=strcat(newS,oldS(i));
        i=i+1;
    end
    set(handles.text4,'String',strcat(newS,b));
elseif key(1)=='3'
        if key(2)=='2'
            if key(3)=='1'
                newS=get(handles.text5,'String');
                oldS='';
                i=1;
                while i < length(newS)-str2double(key(4))
                    newS=strcat(oldS,newS(i));
                    i=i+1;
                end
                oldS=newS;
                
            else
                newS=get(handles.text5,'String');
                oldS='';
                i=1;
                while i < length(newS)-str2double(key(4))+1
                    oldS=strcat(oldS,newS(i));
                    i=i+1;
                end
            end
        else
            oldS=get(handles.text5,'String');
        end
        
        newS=strcat(get(handles.text4,'String'),oldS);
        f = str2func(strcat('@(x)0+',newS));
        i = f(1);
        set(handles.text5,'String',i);
        if isempty(get(handles.text4,'String'))
            set(handles.text4,'String',strcat(newS,b));
        else
            set(handles.text4,'String',strcat('(',newS,')',b));
        end
        
elseif key(1)=='4'
    newS=get(handles.text5,'String');
    oldS='';
    i=1;
    while i < length(newS)
        oldS=strcat(oldS,newS(i));
        i=i+1;
    end
        
    newS=strcat(get(handles.text4,'String'),oldS);
    f = str2func(strcat('@(x)',newS));
    i = f(1);
    set(handles.text5,'String',i);
    if isempty(get(handles.text4,'String'))
        set(handles.text4,'String',strcat(newS,b));
    else
        set(handles.text4,'String',strcat('(',newS,')',b));
    end
      
end
set(handles.text6,'String','2110');
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='-';
if key(1)=='1'
    set(handles.text4,'String',strcat(get(handles.text5,'String'),b));
elseif key(1)=='2'
    oldS=get(handles.text4,'String');
    newS='';
    i=1;
    while i < length(oldS)
        newS=strcat(newS,oldS(i));
        i=i+1;
    end
    set(handles.text4,'String',strcat(newS,b));
elseif key(1)=='3'
        if key(2)=='2'
            if key(3)=='1'
                newS=get(handles.text5,'String');
                oldS='';
                i=1;
                while i < length(newS)-str2double(key(4))
                    newS=strcat(oldS,newS(i));
                    i=i+1;
                end
                oldS=newS;
                
            else
                newS=get(handles.text5,'String');
                oldS='';
                i=1;
                while i < length(newS)-str2double(key(4))+1
                    oldS=strcat(oldS,newS(i));
                    i=i+1;
                end
            end
        else
            oldS=get(handles.text5,'String');
        end
        
        newS=strcat(get(handles.text4,'String'),oldS);
        f = str2func(strcat('@(x)0+',newS));
        i = f(1);
        set(handles.text5,'String',i);
        if isempty(get(handles.text4,'String'))
            set(handles.text4,'String',strcat(newS,b));
        else
            set(handles.text4,'String',strcat('(',newS,')',b));
        end
        
elseif key(1)=='4'
    newS=get(handles.text5,'String');
    oldS='';
    i=1;
    while i < length(newS)
        oldS=strcat(oldS,newS(i));
        i=i+1;
    end
        
    newS=strcat(get(handles.text4,'String'),oldS);
    f = str2func(strcat('@(x)',newS));
    i = f(1);
    set(handles.text5,'String',i);
    if isempty(get(handles.text4,'String'))
        set(handles.text4,'String',strcat(newS,b));
    else
        set(handles.text4,'String',strcat('(',newS,')',b));
    end
      
end
set(handles.text6,'String','2110');
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='*';
if key(1)=='1'
    set(handles.text4,'String',strcat(get(handles.text5,'String'),b));
elseif key(1)=='2'
    oldS=get(handles.text4,'String');
    newS='';
    i=1;
    while i < length(oldS)
        newS=strcat(newS,oldS(i));
        i=i+1;
    end
    set(handles.text4,'String',strcat(newS,b));
elseif key(1)=='3'
        if key(2)=='2'
            if key(3)=='1'
                newS=get(handles.text5,'String');
                oldS='';
                i=1;
                while i < length(newS)-str2double(key(4))
                    newS=strcat(oldS,newS(i));
                    i=i+1;
                end
                oldS=newS;
                
            else
                newS=get(handles.text5,'String');
                oldS='';
                i=1;
                while i < length(newS)-str2double(key(4))+1
                    oldS=strcat(oldS,newS(i));
                    i=i+1;
                end
            end
        else
            oldS=get(handles.text5,'String');
        end
        
        newS=strcat(get(handles.text4,'String'),oldS);
        f = str2func(strcat('@(x)0+',newS));
        i = f(1);
        set(handles.text5,'String',i);
        if isempty(get(handles.text4,'String'))
            set(handles.text4,'String',strcat(newS,b));
        else
            set(handles.text4,'String',strcat('(',newS,')',b));
        end
        
elseif key(1)=='4'
    newS=get(handles.text5,'String');
    oldS='';
    i=1;
    while i < length(newS)
        oldS=strcat(oldS,newS(i));
        i=i+1;
    end
        
    newS=strcat(get(handles.text4,'String'),oldS);
    f = str2func(strcat('@(x)',newS));
    i = f(1);
    set(handles.text5,'String',i);
    if isempty(get(handles.text4,'String'))
        set(handles.text4,'String',strcat(newS,b));
    else
        set(handles.text4,'String',strcat('(',newS,')',b));
    end
      
end
set(handles.text6,'String','2110');
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='/';
if key(1)=='1'
    set(handles.text4,'String',strcat(get(handles.text5,'String'),b));
elseif key(1)=='2'
    oldS=get(handles.text4,'String');
    newS='';
    i=1;
    while i < length(oldS)
        newS=strcat(newS,oldS(i));
        i=i+1;
    end
    set(handles.text4,'String',strcat(newS,b));
elseif key(1)=='3'
        if key(2)=='2'
            if key(3)=='1'
                newS=get(handles.text5,'String');
                oldS='';
                i=1;
                while i < length(newS)-str2double(key(4))
                    newS=strcat(oldS,newS(i));
                    i=i+1;
                end
                oldS=newS;
                
            else
                newS=get(handles.text5,'String');
                oldS='';
                i=1;
                while i < length(newS)-str2double(key(4))+1
                    oldS=strcat(oldS,newS(i));
                    i=i+1;
                end
            end
        else
            oldS=get(handles.text5,'String');
        end
        
        newS=strcat(get(handles.text4,'String'),oldS);
        f = str2func(strcat('@(x)0+',newS));
        i = f(1);
        set(handles.text5,'String',i);
        if isempty(get(handles.text4,'String'))
            set(handles.text4,'String',strcat(newS,b));
        else
            set(handles.text4,'String',strcat('(',newS,')',b));
        end
        
elseif key(1)=='4'
    newS=get(handles.text5,'String');
    oldS='';
    i=1;
    while i < length(newS)
        oldS=strcat(oldS,newS(i));
        i=i+1;
    end
        
    newS=strcat(get(handles.text4,'String'),oldS);
    f = str2func(strcat('@(x)',newS));
    i = f(1);
    set(handles.text5,'String',i);
    if isempty(get(handles.text4,'String'))
        set(handles.text4,'String',strcat(newS,b));
    else
        set(handles.text4,'String',strcat('(',newS,')',b));
    end
      
end
set(handles.text6,'String','2110');
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
key=get(handles.text6,'String');
b='1';
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String',b);
elseif key(1)=='3'
    if key(2)=='1' && key(3)=='1'
        set(handles.text5,'String',b);
    else
        set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
    end
elseif key(1)=='4'
    set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
end
set(handles.text6,'String',strcat('3',key(2),'20'));
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='2';
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String',b);
elseif key(1)=='3'
    if key(2)=='1' && key(3)=='1'
        set(handles.text5,'String',b);
    else
        set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
    end
elseif key(1)=='4'
    set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
end
set(handles.text6,'String',strcat('3',key(2),'20'));
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='3';
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String',b);
elseif key(1)=='3'
    if key(2)=='1' && key(3)=='1'
        set(handles.text5,'String',b);
    else
        set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
    end
elseif key(1)=='4'
    set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
end
set(handles.text6,'String',strcat('3',key(2),'20'));
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='4';
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String',b);
elseif key(1)=='3'
    if key(2)=='1' && key(3)=='1'
        set(handles.text5,'String',b);
    else
        set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
    end
elseif key(1)=='4'
    set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
end
set(handles.text6,'String',strcat('3',key(2),'20'));
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='5';
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String',b);
elseif key(1)=='3'
    if key(2)=='1' && key(3)=='1'
        set(handles.text5,'String',b);
    else
        set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
    end
elseif key(1)=='4'
    set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
end
set(handles.text6,'String',strcat('3',key(2),'20'));
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='6';
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String',b);
elseif key(1)=='3'
    if key(2)=='1' && key(3)=='1'
        set(handles.text5,'String',b);
    else
        set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
    end
elseif key(1)=='4'
    set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
end
set(handles.text6,'String',strcat('3',key(2),'20'));
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='7';
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String',b);
elseif key(1)=='3'
    if key(2)=='1' && key(3)=='1'
        set(handles.text5,'String',b);
    else
        set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
    end
elseif key(1)=='4'
    set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
end
set(handles.text6,'String',strcat('3',key(2),'20'));
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='8';
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String',b);
elseif key(1)=='3'
    if key(2)=='1' && key(3)=='1'
        set(handles.text5,'String',b);
    else
        set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
    end
elseif key(1)=='4'
    set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
end
set(handles.text6,'String',strcat('3',key(2),'20'));
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
b='9';
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String',b);
elseif key(1)=='3'
    if key(2)=='1' && key(3)=='1'
        set(handles.text5,'String',b);
    else
        set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
    end
elseif key(1)=='4'
    set(handles.text5,'String',strcat(get(handles.text5,'String'),b));
end
set(handles.text6,'String',strcat('3',key(2),'20'));
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
key=get(handles.text6,'String');
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String','0');
    set(handles.text6,'String','3110');
elseif key(1)=='3'
    if key(2)=='1' 
        if key(3)=='2'
            set(handles.text5,'String',strcat(get(handles.text5,'String'),'0'));
        end
    else
        set(handles.text5,'String',strcat(get(handles.text5,'String'),'0'));
        set(handles.text6,'String',strcat('32',key(3),num2str(str2double(key(4))+1)));
    end
elseif key(1)=='4'
    set(handles.text5,'String',strcat(get(handles.text5,'String'),'0'));
    set(handles.text6,'String','3211');
end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
key=get(handles.text6,'String');
if key(1)=='1' || key(1)=='2'
    set(handles.text5,'String','0');
    set(handles.text6,'String','3110');
elseif key(1)=='4'
    oldS=get(handles.text5,'String');
    newS='';
    i=1;
    while i < length(oldS)
        newS=strcat(newS,oldS(i));
        i=i+1;
    end
    set(handles.text5,'String',newS);
    if newS(1)=='0'
        set(handles.text6,'String','3110');
    else
        set(handles.text6,'String','3120');
    end
else %  key(1)=='3'
    if key(2)=='1'
        oldS=get(handles.text5,'String');
        if length(oldS)==1
            set(handles.text5,'String','0');
            set(handles.text6,'String','3110');
        else
            oldS=get(handles.text5,'String');
            newS='';
            i=1;
            while i < length(oldS)
                newS=strcat(newS,oldS(i));
                i=i+1;
            end
            set(handles.text5,'String',newS);
            set(handles.text6,'String',strcat('3120'));
        end
    else% key(2)=='2'
        if key(3)=='1'
            if key(4)=='1'
                oldS=get(handles.text5,'String');
                newS='';
                i=1;
                while i < length(oldS)
                    newS=strcat(newS,oldS(i));
                    i=i+1;
                end
                set(handles.text5,'String',newS);
                set(handles.text6,'String','4210');
            else
                oldS=get(handles.text5,'String');
                newS='';
                i=1;
                while i < length(oldS)
                    newS=strcat(newS,oldS(i));
                    i=i+1;
                end
                set(handles.text5,'String',newS);
                set(handles.text6,'String',strcat('321',num2str(str2double(key(4))-1)));
            end
        else
            oldS=get(handles.text5,'String');
            newS='';
            i=1;
            while i < length(oldS)
                newS=strcat(newS,oldS(i));
                i=i+1;
            end
            set(handles.text5,'String',newS);
            if newS(length(newS))=='.'
                set(handles.text6,'String','4210');
            else
                nulls=0;
                isnull=1;
                i=length(newS);
                while i > 0
                    if newS(i)=='.'
                        i = 0;
                    elseif newS(i)=='0'
                        if isnull==1
                            nulls=nulls+1;
                        end
                    else
                        isnull=2;
                    end
                    i=i-1;
                end
                set(handles.text6,'String',strcat('32',num2str(isnull),num2str(nulls)));
            end
        end
    end
end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
key=get(handles.text6,'String');
if key(1)=='1' || key(1)=='2'
    %nothing
elseif key(1)=='3'
        if key(2)=='2'
            if key(3)=='1'
                newS=get(handles.text5,'String');
                oldS='';
                i=1;
                while i < length(newS)-str2double(key(4))
                    newS=strcat(oldS,newS(i));
                    i=i+1;
                end
                oldS=newS;
                
            else
                newS=get(handles.text5,'String');
                oldS='';
                i=1;
                while i < length(newS)-str2double(key(4))+1
                    oldS=strcat(oldS,newS(i));
                    i=i+1;
                end
            end
        else
            oldS=get(handles.text5,'String');
        end
        
        newS=strcat(get(handles.text4,'String'),oldS);
        f = str2func(strcat('@(x)0+',newS));
        i = f(1);
        set(handles.text5,'String',i);
        set(handles.text4,'String','');
        
elseif key(1)=='4'
    newS=get(handles.text5,'String');
    oldS='';
    i=1;
    while i < length(newS)
        oldS=strcat(oldS,newS(i));
        i=i+1;
    end
        
    newS=strcat(get(handles.text4,'String'),oldS);
    f = str2func(strcat('@(x)',newS));
    i = f(1);
    set(handles.text5,'String',i);
    set(handles.text4,'String','');
      
end
set(handles.text6,'String','1110');
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
