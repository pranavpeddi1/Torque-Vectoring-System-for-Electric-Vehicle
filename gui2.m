function varargout = gui2(varargin)

% GUI2 MATLAB code for gui2.fig
%      GUI2, by itself, creates a new GUI2 or raises the existing
%      singleton*.
%
%      H = GUI2 returns the handle to a new GUI2 or the handle to
%      the existing singleton*.
%
%      GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2.M with the given input arguments.
%
%      GUI2('Property','Value',...) creates a new GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui2

% Last Modified by GUIDE v2.5 26-Apr-2019 08:22:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui2_OpeningFcn, ...
                   'gui_OutputFcn',  @gui2_OutputFcn, ...
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


% --- Executes just before gui2 is made visible.
function gui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui2 (see VARARGIN)

% Choose default command line output for gui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui2_OutputFcn(hObject, eventdata, handles) 
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
input = str2num(get(hObject,'String'));

if (isempty(input))
    set(hObject,'String','0');
end
guidata(hObject, handles);

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2num(get(hObject,'String'));

if (isempty(input))
    set(hObject,'String','0');
end
guidata(hObject, handles);

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


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
if get(hObject,'Value')==1
    set(handles.radiobutton5,'Value',0);
    set(handles.radiobutton6,'Value',0);
    set(handles.radiobutton9,'Value',0);
end
    
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes during object creation, after setting all properties.
function edit3_Callback(hObject, eventdata, handles)


% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l = 3;
v = get(handles.edit1,'String');
v = str2num(v);
delta = get(handles.edit2,'String');
delta = str2num(delta);
delta = delta*pi/180;

m = 1500; g =9.81;l = 3;a = 1.3;b = l-a;
cf = 67369;cr = 63411; % From Genta
% cf = 100000;cr = 120000; % From Czech Paper

x = get(handles.radiobutton4,'Value');
y = get(handles.radiobutton5,'Value');
z = get(handles.radiobutton6,'Value');
p = get(handles.radiobutton9,'Value');

pg = 1/l;
rdes = 1/(pg*abs(delta));
psidotdes = v*pg*delta;
if x==1     
    rdes = num2str(rdes);psidotdes = num2str(psidotdes);
    set(handles.text11,'String',rdes);
    set(handles.text10,'String',psidotdes);
    set(handles.text14,'String',0);
set(handles.text16,'String',0);
elseif y==1
    kus = m*g*(b/cf - a/cr)/l^2; %understeer gradient
    pg1 = (1/l)*(1/(1+kus*v^2/(g*l)));
    ract1 = 1/(pg1*delta);
    psidotact1 = v/ract1;
    ract = num2str(ract1);
    psidotact1 = num2str(psidotact1);
    
    set(handles.text11,'String',ract1);
    set(handles.text10,'String',psidotact1);
    set(handles.text14,'String',0);
    set(handles.text16,'String',0);
elseif z==1
        
    S = 1.7;
    % cyb = 0;%
    cyb = -2.2;
    % cmzb = 0;%
    cmzb = 0.6;
    % mz1a = 0;%
    mz1a = 2010;
    % mz2a = 0;%
    mz2a = 1366;
    rho = 1.225;I = 2000;

    ybeta = -(cf + cr + 0.5*rho*v^2*S*cyb);
    yr = -(1/v)*(a*cf - b*cr);
    ydelta = cf;

    nbeta = (-a*cf + b*cr + mz1a + mz2a) + 0.5*rho*v^2*S*cmzb;
    nr = (1/v)*(-a^2*cf - b^2*cr+ mz1a*a - mz2a*b);
    ndelta = cf*a - mz1a ;

    p = v*I*m;q = -ybeta*I-v*m*nr; u = nbeta*(v*m-yr) + nr*ybeta;

    sd = -ndelta*(v*m-yr)-nr*ydelta;
    sdd = ydelta.*nbeta - ndelta.*ybeta;
    tdd = v.*m.*ndelta;
    ddelta = 0;
    mzedot = 0; mze = 0; fye = 0;

    pgact2 = (ydelta.*nbeta - ndelta.*ybeta)./(v.*(nbeta.*(v.*m - yr) + nr.*ybeta));
    ract2 = 1/(pgact2*delta);
    psidotact2 = v/ract2;
    ract2 = num2str(ract2);
    psidotact2 = num2str(psidotact2);
    
    set(handles.text11,'String',ract2);
    set(handles.text10,'String',psidotact2);
    
    set(handles.text14,'String',0);
    set(handles.text16,'String',0);
elseif p==1  
    S = 1.7;
    % cyb = 0;%
    cyb = -2.2;
    % cmzb = 0;%
    cmzb = 0.6;
    % mz1a = 0;%
    mz1a = 2010;
    % mz2a = 0;%
    mz2a = 1366;
    rho = 1.225;I = 2000;

    ybeta = -(cf + cr + 0.5*rho*v^2*S*cyb);
    yr = -(1/v)*(a*cf - b*cr);
    ydelta = cf;

    nbeta = (-a*cf + b*cr + mz1a + mz2a) + 0.5*rho*v^2*S*cmzb;
    nr = (1/v)*(-a^2*cf - b^2*cr+ mz1a*a - mz2a*b);
    ndelta = cf*a - mz1a ;

    p = v*I*m;q = -ybeta*I-v*m*nr; u = nbeta*(v*m-yr) + nr*ybeta;

    sd = -ndelta*(v*m-yr)-nr*ydelta;
    sdd = ydelta*nbeta - ndelta*ybeta;
    tdd = v*m*ndelta;
    ddelta = 0;fye = 0;mzedot = 0;rdot = 0;

    mze = (sdd*delta + tdd*ddelta + nbeta*fye + m*v*mzedot - q*rdot - u*psidotdes)/ybeta;
       
    tout = linspace(0,pi/psidotdes,100);
    a = mze;
    options = odeset('RelTol', 1e-10, 'AbsTol', 1e-12);
    [t,state] = ode45(@(t,r) yawratenew(t,r,abs(a),abs(delta),v),tout,[0;0],options);
    
    psidotcor = state(end,1);
    rcor = v/psidotcor;
    
    rcor = num2str(rcor);psidotcor = num2str(psidotcor);
    
    rw = 0.3; w = 1.56;treq = 800;
%     t1 = tout;
%     t2 = tout1(2:end)+tout(end);
    dtw = mze*rw/w;
    trw = treq + dtw; tlw = treq - dtw;
    trw = num2str(trw);tlw = num2str(tlw);
    
    set(handles.text11,'String',rcor);
    set(handles.text10,'String',psidotcor);
    set(handles.text14,'String',trw);
    set(handles.text16,'String',tlw);
    
end
guidata(hObject, handles);

function drdt = yawratenew(t,r,mze,delta,v)
    m = 1500;
    I = 2000;
    l = 3;a = 1.3;b = l-a;
%     cf = 100000;cr = 120000; % Czech Thesis
    cf = 67369; cr = 63411; % Genta

    S = 1.7;
    cyb = -2.2;
    cmzb = 0.6;
    mz1a = 2010;
    mz2a = 1366;
    rho = 1.225;I = 2000;

    ybeta = -(cf + cr) + 0.5*rho*v.^2*S*cyb;
    yr = -(1./v).*(a*cf - b*cr);
    ydelta = cf;

    nbeta = (-a*cf + mz1a + b*cr + mz2a) + 0.5*rho*v.^2*S*cmzb;
    nr = (1./v).*(-a^2*cf - b^2*cr + mz1a*a - mz2a*b);
    ndelta = cf*a - mz1a ;

    p = v.*I*m;q = -ybeta.*I-v.*m.*nr; u = nbeta.*(v.*m-yr) + nr.*ybeta;

    sd = -ndelta.*(v.*m-yr)-nr.*ydelta;
    sdd = ydelta.*nbeta - ndelta.*ybeta;
    tdd = v.*m.*ndelta;
    ddelta = 0;
    mzedot = 0;
    fye = 0;

    drdt = [r(2);(sdd*delta + tdd*ddelta + nbeta*fye - ybeta*mze + m*v*mzedot - q*r(2) - u*r(1))/p];


% --- Executes during object creation, after setting all properties.
function text11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
if get(hObject,'Value')==1
    set(handles.radiobutton4,'Value',0);
    set(handles.radiobutton6,'Value',0);
    set(handles.radiobutton9,'Value',0);
end
    
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
if get(hObject,'Value')==1
    set(handles.radiobutton4,'Value',0);
    set(handles.radiobutton5,'Value',0);
    set(handles.radiobutton9,'Value',0);
end
    
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text10,'String',0);
set(handles.text11,'String',0);
set(handles.text14,'String',0);
set(handles.text16,'String',0);


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
if get(hObject,'Value')==1
    set(handles.radiobutton4,'Value',0);
    set(handles.radiobutton5,'Value',0);
    set(handles.radiobutton6,'Value',0);
end
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9
