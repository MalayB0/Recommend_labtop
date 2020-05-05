data = xml2struct(xmlread('http://api.danawa.com/api/main/category/product/list?charset=euckr&key=733b76ee204aaa8b359c9be395b3f70e&cate1=860&cate2=869&orderBy=productNameDESC&limit=100&offset=0'));
%d = char(string(data.productCategories.productCategory{1, 1}.product.productSimpleDescription.importantOptionString.Text));

%imgread('http://img.danawa.com/prod_img/500000/842/602/img/5602842_1.jpg?shrink=80:80')
% = char(string());
data_detail = xml2struct(xmlread('http://api.danawa.com/api/search/product/info?key=733b76ee204aaa8b359c9be395b3f70e&keyword=%EB%85%B8%ED%8A%B8%EB%B6%81&mediatype=xml&charset=utf8&limit=100&option_keyword'));

%b = imread('http://img.danawa.com/prod_img/500000/575/478/img/3478575_1.jpg?shrink=80:80')
%imshow(b)

index = str2num(data.productCategories.productCategory{1, 2}.product.minPrice.Text);


%strfind
cnt = 1;
for z = 1:1:100
    if str2num(data.productCategories.productCategory{1, z}.product.minPrice.Text) < 300000
        list(cnt,1) = str2num(data.productCategories.productCategory{1, z}.product.minPrice.Text);
        cnt=cnt+1;
    end
end

cnt