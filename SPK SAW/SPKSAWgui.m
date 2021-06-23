function varargout = SPKSAWgui(varargin)
% SPKSAWGUI MATLAB code for SPKSAWgui.fig
%      SPKSAWGUI, by itself, creates a new SPKSAWGUI or raises the existing
%      singleton*.
%
%      H = SPKSAWGUI returns the handle to a new SPKSAWGUI or the handle to
%      the existing singleton*.
%
%      SPKSAWGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPKSAWGUI.M with the given input arguments.
%
%      SPKSAWGUI('Property','Value',...) creates a new SPKSAWGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SPKSAWgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SPKSAWgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SPKSAWgui

% Last Modified by GUIDE v2.5 23-Jun-2021 22:35:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SPKSAWgui_OpeningFcn, ...
                   'gui_OutputFcn',  @SPKSAWgui_OutputFcn, ...
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


% --- Executes just before SPKSAWgui is made visible.
function SPKSAWgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SPKSAWgui (see VARARGIN)

% Choose default command line output for SPKSAWgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SPKSAWgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SPKSAWgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%urutan proses adalah data cabai rawit, cabai hijau, cabai merah, dan
%paprika sesuai dengan tabel pada file docx

x=[40000,4,50,40;35000,2,30,25;90000,3,30,28;100000,1,10,9];
k=[0,0,1,1];
w=[0.25,0.2,0.3,0.2];

%tahapan 1. normalisasi matriks
[m n]=size (x); % matriks mxn dengan ukuran sebanyak variabel x(input)
R=zeros (m,n); % membuat matriks R, matriks kosong
Y=zeros (m,n); % membuat matriks Y, matriks kosong
for j=1:n,
    if k(j)==1, %statement untuk kriterian dengan atribut benefit
        R(:,j)=x(:,j)./max(x(:,j));
    else %statement kriteria atribut cost
        R(:,j)=min(x(:,j))./x(:,j);
    end;
end;

%tahapan kedua, proses perangkingan
CR =  sum(w.*R(1,:))
CH =  sum(w.*R(2,:))
CM =  sum(w.*R(3,:))
P  =  sum(w.*R(4,:))

set(handles.CR, 'String', CR); 
set(handles.CH, 'String', CH);
set(handles.CM, 'String', CM);
set(handles.P, 'String', P);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
