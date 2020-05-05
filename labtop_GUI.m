function varargout = DB_GUI(varargin)

% DB_GUI MATLAB code for DB_GUI.fig
%      DB_GUI, by itself, creates a new DB_GUI or raises the existing
%      singleton*.
%
%      H = DB_GUI returns the handle to a new DB_GUI or the handle to
%      the existing singleton*.
%
%      DB_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DB_GUI.M with the given input arguments.
%
%      DB_GUI('Property','Value',...) creates a new DB_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DB_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DB_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DB_GUI

% Last Modified by GUIDE v2.5 10-Dec-2017 23:35:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DB_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DB_GUI_OutputFcn, ...
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
 

% --- Executes just before DB_GUI is made visible.
function DB_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DB_GUI (see VARARGIN)

% Choose default command line output for DB_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DB_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DB_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in class1.
function class1_Callback(hObject, eventdata, handles)
% hObject    handle to class1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if((get(hObject,'value')) == 1)
    set(handles.class2,'string',['선택2'])
    disp(get(handles.class1,'string'));
elseif((get(hObject,'value')) == 2)
    set(handles.class2,'string',['빠릿하게';'저렴하게'])
elseif((get(hObject,'value')) ==3)
    set(handles.class2,'string',['2D-캐주얼게임';'3D-피파,롤급';'3D-오버워치급';'3D-패키지게임'])
elseif((get(hObject,'value')) ==4)
    set(handles.class2,'string',['초급';'고급'])
elseif((get(hObject,'value')) ==5)
    set(handles.class2,'string',['맥북'])
end
% Hints: contents = cellstr(get(hObject,'String')) returns class1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from class1


% --- Executes during object creation, after setting all properties.
function class1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to class1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in class2.
function class2_Callback(hObject, eventdata, handles)
% hObject    handle to class2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns class2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from class2


% --- Executes during object creation, after setting all properties.
function class2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to class2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in button.
function button_Callback(hObject, eventdata, handles)
% hObject    handle to button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = xml2struct(xmlread('http://api.danawa.com/api/main/category/product/list?charset=euckr&key=733b76ee204aaa8b359c9be395b3f70e&cate1=860&cate2=869&orderBy=saveCountDESC&limit=100&offset=0'));
clearvars speclist fullname;
won = '원'; 
if((get(handles.class1,'value')) == 2) % 사무용
    if((get(handles.class2,'value')) == 1) % 빠릿하게
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if (contains(spec,'i3') || contains(spec,'펜티엄')) && (contains(spec,'128') || contains(spec,'120'))
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                prodnum (cnt,1) = z;
                cnt=cnt+1;
            end
       end
        set(handles.prod_index,'string',fullname);
    end
    if((get(handles.class2,'value')) == 2) % 저렴하게
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if (str2num(data.productCategories.productCategory{1, z}.product.minPrice.Text) < 420000)
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                prodnum (cnt,1) = z;
                cnt=cnt+1;
            end
       end
        set(handles.prod_index,'string',fullname);
    end
end
 
if((get(handles.class1,'value')) == 3) %게이밍
     if (((get(handles.class2,'value')) == 1) || ((get(handles.class2,'value')) == 2)) % 2D,캐주얼 / 3D저급
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if (contains(spec,'i3') || contains(spec,'i5')) && ((contains(spec,'128') || contains(spec,'120') || contains(spec,'250') || contains(spec,'256'))) & (str2num(data.productCategories.productCategory{1, z}.product.minPrice.Text) < 700000)
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                prodnum (cnt,1) = z;
                cnt=cnt+1;
            end
       end
        set(handles.prod_index,'string',fullname);
     end
    
    if((get(handles.class2,'value')) == 3) % 3D,오버워치급
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if contains(spec,'i5') && contains(spec,'GTX1050') && (contains(spec,'250') || contains(spec,'256'))
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                prodnum (cnt,1) = z;
                cnt=cnt+1;
            end
       end
        set(handles.prod_index,'string',fullname);
    end
    
    
    if((get(handles.class2,'value')) == 4) % 패키지게임
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if (contains(spec,'i5') || contains(spec,'i7')) && (contains(spec,'GTX1050') || contains(spec,'GTX1060') || contains(spec,'GTX1070') || contains(spec,'GTX1080')) && (contains(spec,'250') || contains(spec,'256') || contains(spec,'512'))
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                prodnum (cnt,1) = z;
                cnt=cnt+1;
            end
       end
        set(handles.prod_index,'string',fullname);
    end
end

if((get(handles.class1,'value')) == 4) % 3D 모델링
    if (get(handles.class2,'value') == 1) % 3D 초급
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if (contains(spec,'i3') || contains(spec,'i5')) && ((contains(spec,'128') || contains(spec,'120') || contains(spec,'250') || contains(spec,'256'))) & (str2num(data.productCategories.productCategory{1, z}.product.minPrice.Text) < 700000)
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                prodnum (cnt,1) = z;
                cnt=cnt+1;
            end
       end
        set(handles.prod_index,'string',fullname);
    end
end

    if (get(handles.class2,'value')) == 2 % 3D모델링 고급
        set(handles.prod_index,'string','노트북에서 이런거 하지 마세요');
    end
end

if((get(handles.class1,'value') == 5) && (get(handles.class2,'value') == 1)) % 사운드 / MIDI
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if contains(spec,'Mac')
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                prodnum (cnt,1) = z;
                cnt=cnt+1;
            end
       end
        set(handles.prod_index,'string',fullname);
end





% --- Executes on selection change in prod_index.
function prod_index_Callback(hObject, eventdata, handles)
% hObject    handle to prod_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set(handles.prod_name,'string',fullname(prodnum(get(hObject,'value'),1)));
%disp(fullname(prodnum(get(hObject,'value'),1)))
data = xml2struct(xmlread('http://api.danawa.com/api/main/category/product/list?charset=euckr&key=733b76ee204aaa8b359c9be395b3f70e&cate1=860&cate2=869&orderBy=saveCountDESC&limit=100&offset=0'));
clearvars speclist fullname;
won = '원'; 
if((get(handles.class1,'value')) == 2) % 사무용
    if((get(handles.class2,'value')) == 1) % 빠릿하게
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if (contains(spec,'i3') || contains(spec,'펜티엄')) && (contains(spec,'128') || contains(spec,'120'))
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                except_price(cnt,1) = strcat(makername,brandname,productname);
                prodnum (cnt,1) = z;
                price_won (cnt,1) = strcat(price,won);
                makedate_index(cnt,1) = makedate;
                img_index(cnt,1) = imageurl;
                cnt=cnt+1;
            end
       end
       %disp(img_index(str2mat((handles.prod_index , 'value'),1)));
       set(handles.prod_name,'string',except_price(get(handles.prod_index,'value'),1));
       set(handles.price,'string',string(price_won(get(handles.prod_index,'value'),1)));
       set(handles.date,'string',makedate_index(get(handles.prod_index,'value'),1));
       set(handles.product_introduce,'string',speclist(get(handles.prod_index,'value'),1));
       temp = str2mat(img_index(get(handles.prod_index,'value'),1));
       pic = imread(temp);
       axes(handles.image);
       imshow(pic);
    end
    if((get(handles.class2,'value')) == 2) % 저렴하게
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if (str2num(data.productCategories.productCategory{1, z}.product.minPrice.Text) < 420000)
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                except_price(cnt,1) = strcat(makername,brandname,productname);
                prodnum (cnt,1) = z;
                price_won (cnt,1) = strcat(price,won);
                makedate_index(cnt,1) = makedate;
                img_index(cnt,1) = imageurl;
                cnt=cnt+1;
            end
       end
       %disp(img_index(str2mat((handles.prod_index , 'value'),1)));
       set(handles.prod_name,'string',except_price(get(handles.prod_index,'value'),1));
       set(handles.price,'string',string(price_won(get(handles.prod_index,'value'),1)));
       set(handles.date,'string',makedate_index(get(handles.prod_index,'value'),1));
       set(handles.product_introduce,'string',speclist(get(handles.prod_index,'value'),1));
       temp = str2mat(img_index(get(handles.prod_index,'value'),1));
       pic = imread(temp);
       axes(handles.image);
       imshow(pic);
    end
end
 
if((get(handles.class1,'value')) == 3) %게이밍
     if (((get(handles.class2,'value')) == 1) || ((get(handles.class2,'value')) == 2)) % 2D,캐주얼 / 3D저급
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if (contains(spec,'i3') || contains(spec,'i5')) && ((contains(spec,'128') || contains(spec,'120') || contains(spec,'250') || contains(spec,'256'))) & (str2num(data.productCategories.productCategory{1, z}.product.minPrice.Text) < 700000)
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                except_price(cnt,1) = strcat(makername,brandname,productname);
                prodnum (cnt,1) = z;
                price_won (cnt,1) = strcat(price,won);
                makedate_index(cnt,1) = makedate;
                img_index(cnt,1) = imageurl;
                cnt=cnt+1;
            end
       end
       %disp(img_index(str2mat((handles.prod_index , 'value'),1)));
       set(handles.prod_name,'string',except_price(get(handles.prod_index,'value'),1));
       set(handles.price,'string',string(price_won(get(handles.prod_index,'value'),1)));
       set(handles.date,'string',makedate_index(get(handles.prod_index,'value'),1));
       set(handles.product_introduce,'string',speclist(get(handles.prod_index,'value'),1));
       temp = str2mat(img_index(get(handles.prod_index,'value'),1));
       pic = imread(temp);
       axes(handles.image);
       imshow(pic);
     end
    
    if((get(handles.class2,'value')) == 3) % 3D,오버워치급
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if contains(spec,'i5') && contains(spec,'GTX1050') && (contains(spec,'250') || contains(spec,'256'))
               speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                except_price(cnt,1) = strcat(makername,brandname,productname);
                prodnum (cnt,1) = z;
                price_won (cnt,1) = strcat(price,won);
                makedate_index(cnt,1) = makedate;
                img_index(cnt,1) = imageurl;
                cnt=cnt+1;
            end
       end
       %disp(img_index(str2mat((handles.prod_index , 'value'),1)));
       set(handles.prod_name,'string',except_price(get(handles.prod_index,'value'),1));
       set(handles.price,'string',string(price_won(get(handles.prod_index,'value'),1)));
       set(handles.date,'string',makedate_index(get(handles.prod_index,'value'),1));
       set(handles.product_introduce,'string',speclist(get(handles.prod_index,'value'),1));
       temp = str2mat(img_index(get(handles.prod_index,'value'),1));
       pic = imread(temp);
       axes(handles.image);
       imshow(pic);
    end
    
    
    if((get(handles.class2,'value')) == 4) % 패키지게임
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
            if (contains(spec,'i5') || contains(spec,'i7')) && (contains(spec,'GTX1050') || contains(spec,'GTX1060') || contains(spec,'GTX1070') || contains(spec,'GTX1080')) && (contains(spec,'250') || contains(spec,'256') || contains(spec,'512'))
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                except_price(cnt,1) = strcat(makername,brandname,productname);
                prodnum (cnt,1) = z;
                price_won (cnt,1) = strcat(price,won);
                makedate_index(cnt,1) = makedate;
                img_index(cnt,1) = imageurl;
                cnt=cnt+1;
            end
       end
       %disp(img_index(str2mat((handles.prod_index , 'value'),1)));
       set(handles.prod_name,'string',except_price(get(handles.prod_index,'value'),1));
       set(handles.price,'string',string(price_won(get(handles.prod_index,'value'),1)));
       set(handles.date,'string',makedate_index(get(handles.prod_index,'value'),1));
       set(handles.product_introduce,'string',speclist(get(handles.prod_index,'value'),1));
       temp = str2mat(img_index(get(handles.prod_index,'value'),1));
       pic = imread(temp);
       axes(handles.image);
       imshow(pic);
    end
end

if((get(handles.class1,'value')) == 4) % 3D 모델링
    if (get(handles.class2,'value') == 1) % 3D 초급
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
                %imageurl    = string(data.productCategories.productCategory{1, z}.image_url.Text);
                %danawaurl   = string(data.productCategories.productCategory{1, z}.danawaUrl.Text);
                %makedate    = string(data.productCategories.productCategory{1, z}.product.makeDate.Text);
            if (contains(spec,'i3') || contains(spec,'i5')) && ((contains(spec,'128') || contains(spec,'120') || contains(spec,'250') || contains(spec,'256'))) & (str2num(data.productCategories.productCategory{1, z}.product.minPrice.Text) < 700000)
               speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                except_price(cnt,1) = strcat(makername,brandname,productname);
                prodnum (cnt,1) = z;
                price_won (cnt,1) = strcat(price,won);
                makedate_index(cnt,1) = makedate;
                img_index(cnt,1) = imageurl;
                cnt=cnt+1;
            end
       end
       %disp(img_index(str2mat((handles.prod_index , 'value'),1)));
       set(handles.prod_name,'string',except_price(get(handles.prod_index,'value'),1));
       set(handles.price,'string',string(price_won(get(handles.prod_index,'value'),1)));
       set(handles.date,'string',makedate_index(get(handles.prod_index,'value'),1));
       set(handles.product_introduce,'string',speclist(get(handles.prod_index,'value'),1));
       temp = str2mat(img_index(get(handles.prod_index,'value'),1));
       pic = imread(temp);
       axes(handles.image);
       imshow(pic);
    end
end

    if (get(handles.class2,'value')) == 2 % 3D모델링 고급
        set(handles.prod_index,'string','노트북에서 이런거 하지 마세요');
    end
end

if((get(handles.class1,'value') == 5) && (get(handles.class2,'value') == 1)) % 사운드 / MIDI
       cnt = 1;
       for z = 1:1:100
                spec        = string(data.productCategories.productCategory{1, z}.product.productSimpleDescription.importantOptionString.Text);
                price       = string(data.productCategories.productCategory{1, z}.product.minPrice.Text);
                makername   = string(data.productCategories.productCategory{1, z}.product.maker.name.Text);
                brandname   = string(data.productCategories.productCategory{1, z}.product.brand.name.Text);
                productname = string(data.productCategories.productCategory{1, z}.product.name.Text);
            if contains(spec,'Mac')
                speclist(cnt,1) = spec;
                fullname(cnt,1) = strcat(makername,brandname,productname,price,won);
                except_price(cnt,1) = strcat(makername,brandname,productname);
                prodnum (cnt,1) = z;
                price_won (cnt,1) = strcat(price,won);
                makedate_index(cnt,1) = makedate;
                img_index(cnt,1) = imageurl;
                cnt=cnt+1;
            end
       end
       %disp(img_index(str2mat((handles.prod_index , 'value'),1)));
       set(handles.prod_name,'string',except_price(get(handles.prod_index,'value'),1));
       set(handles.price,'string',string(price_won(get(handles.prod_index,'value'),1)));
       set(handles.date,'string',makedate_index(get(handles.prod_index,'value'),1));
       set(handles.product_introduce,'string',speclist(get(handles.prod_index,'value'),1));
       temp = str2mat(img_index(get(handles.prod_index,'value'),1));
       pic = imread(temp);
       axes(handles.image);
       imshow(pic);
end



% Hints: contents = cellstr(get(hObject,'String')) returns prod_index contents as cell array
%        contents{get(hObject,'Value')} returns selected item from prod_index


% --- Executes during object creation, after setting all properties.
function prod_index_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prod_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
end
end
end
end
end
end
end

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
