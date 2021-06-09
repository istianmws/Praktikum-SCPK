function varargout = GUI_KABISAT(varargin)
% GUI_KABISAT MATLAB code for GUI_KABISAT.fig
%      GUI_KABISAT, by itself, creates a new GUI_KABISAT or raises the existing
%      singleton*.
%
%      H = GUI_KABISAT returns the handle to a new GUI_KABISAT or the handle to
%      the existing singleton*.
%
%      GUI_KABISAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_KABISAT.M with the given input arguments.
%
%      GUI_KABISAT('Property','Value',...) creates a new GUI_KABISAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_KABISAT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_KABISAT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_KABISAT

% Last Modified by GUIDE v2.5 07-Apr-2021 08:29:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_KABISAT_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_KABISAT_OutputFcn, ...
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


% --- Executes just before GUI_KABISAT is made visible.
function GUI_KABISAT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_KABISAT (see VARARGIN)

% Choose default command line output for GUI_KABISAT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_KABISAT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_KABISAT_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Cek.
function Cek_Callback(hObject, eventdata, handles)
% hObject    handle to Cek (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input=get(handles.edit1,'string'); %ambil inputan
angka1=str2num(input); %ubah inputan jadi angka
if mod(angka1,4)==0
    hasil='Tahun Kabisat';
    if mod(angka1,100)==0 && mod(angka1,400)==0
        hasil='Tahun Kabisat';
    else
        hasil='Tahun Kabisat';
    end
else  
    hasil='Bukan Tahun Kabisat';
end
set(handles.hasil,'string',(hasil));
