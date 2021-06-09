function varargout = JST_PERCEPTRON_GUI(varargin)
% JST_PERCEPTRON_GUI MATLAB code for JST_PERCEPTRON_GUI.fig
%      JST_PERCEPTRON_GUI, by itself, creates a new JST_PERCEPTRON_GUI or raises the existing
%      singleton*.
%
%      H = JST_PERCEPTRON_GUI returns the handle to a new JST_PERCEPTRON_GUI or the handle to
%      the existing singleton*.
%
%      JST_PERCEPTRON_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JST_PERCEPTRON_GUI.M with the given input arguments.
%
%      JST_PERCEPTRON_GUI('Property','Value',...) creates a new JST_PERCEPTRON_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before JST_PERCEPTRON_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to JST_PERCEPTRON_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help JST_PERCEPTRON_GUI

% Last Modified by GUIDE v2.5 02-Jun-2021 20:01:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @JST_PERCEPTRON_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @JST_PERCEPTRON_GUI_OutputFcn, ...
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


% --- Executes just before JST_PERCEPTRON_GUI is made visible.
function JST_PERCEPTRON_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to JST_PERCEPTRON_GUI (see VARARGIN)

% Choose default command line output for JST_PERCEPTRON_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes JST_PERCEPTRON_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = JST_PERCEPTRON_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bobotawal1=str2double(get(handles.bobotawal1,'string'));
bobotawal2=str2double(get(handles.bobotawal2,'string'));
bias=str2double(get(handles.bias,'string'));
net=newp([0 1; 0 1], 1);
net.IW{1,1}=[bobotawal1 bobotawal2];
net.b{1}=[bias];
p=[[1;1] [1;0] [0;1] [0;0]];
t=[1 1 1 0];
net=train(net,p,t);
hasilbobot=net.IW{1,1};
hasilbias=net.b{1};
set(handles.bo1,'String',hasilbobot);
set(handles.Bio,'String',hasilbias);


function bias_Callback(hObject, eventdata, handles)
% hObject    handle to bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bias as text
%        str2double(get(hObject,'String')) returns contents of bias as a double


% --- Executes during object creation, after setting all properties.
function bias_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bobotawal1_Callback(hObject, eventdata, handles)
% hObject    handle to bobotawal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bobotawal1 as text
%        str2double(get(hObject,'String')) returns contents of bobotawal1 as a double


% --- Executes during object creation, after setting all properties.
function bobotawal1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bobotawal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bobotawal2_Callback(hObject, eventdata, handles)
% hObject    handle to bobotawal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bobotawal2 as text
%        str2double(get(hObject,'String')) returns contents of bobotawal2 as a double


% --- Executes during object creation, after setting all properties.
function bobotawal2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bobotawal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
