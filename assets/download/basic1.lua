
-- lua 基础语法

--[[
	输出日志,
	... 可变参数
]]
function log(...)
	print(...);
end

log("Hello World from Lua" , 666, true, 1.1, "中文");

log("使用require \"xx\" 引用其他lua文件,不需要加上（.lua）后缀");

log("----------------------- 变量 -----------------------");
num = 3;
local len = 10;
a = nil;
log("成员变量 num = ", num, "局部变量 len = ", len, "默认类型", a);


log("----------------------- 类型 -----------------------");

param1 = true;
log("类型:", param1, type(param1));

param1 = 1;
log("类型:", param1, type(param1));

param1 = 1.1;
log("类型:", param1, type(param1));

param1 = '单引号';
log("类型:", param1, type(param1));

param1 = "双引号";
log("类型:", param1, type(param1));

param1 = {"name", "gk", "sex", true};
param1["x"] = 100;
log("类型:", param1, type(param1));

log("----------------------- 算术操作符 -----------------------");
c1 = 10+2
c2 = 10-2
c3 = 10*2
c4 = 10/2
c5 = 10^2
c6 = 10%2
c7 = -10+2
log("算术操作符:", c1.."_"..c2.."_"..c3.."_"..c4.."_"..c5.."_"..c6.."_"..c7)


log("----------------------- 关系操作符 -----------------------");

ax =10
bx =20

if ax > bx then
	log("ax > bx");
elseif ax < bx then
    log("ax < bx")
elseif ax == bx then
    log("ax == bx");
end

if ax ~= bx then
	log("~~~~ 需要注意的是不等于符号 ~=  而不是!=");
end

log("----------------------- 循环 -----------------------");
--for
log("从4（第一个参数）涨到10（第二个参数），每次增长以2（第三个参数）为单位");
for i=4,10,2 do
	log("for1:"..i)
end

log("也可以不制定最后一个参数，默认1的增长速度");
for i=1,5 do
	log("for2:"..i)
end

param1 = {"Sunday", "Monday", "Thuesday", "Wednesday", "Thursday", "Friday", "saturday"};

for k,v in pairs(param1) do
	log("for each", k,v)
end
 
--while
i = 0
while i < 10 do
	log("while", i)
	i = i + 1
	if i == 3 then
		break
	end
end
log("while end i = "..i)
 
--repeat
log("repeat 相当于 do while")
i = 34
repeat	
	log("repeat:", i)
	i = i + 2
until i>40

log("----------------------- 函数 -----------------------");

--有一个返回值的函数
function funTestBackOne(aCount)
    local aCount= aCount+1
    return aCount
end
 
a =20
log("一个返回值", funTestBackOne(a))
 
--有多个返回值的函数
function funTestBackTwo(a, b, c)
	return a*a, b*b, c*c
end

a,b,c = funTestBackTwo(4, 12, 53)
log("返回多个参数：", a.." and "..b.." and "..c)
 
--有变长参数的函数
log("遍历可变参数arg，5.2之后需要自己处理一下arg")

function funTestUnKnow( ... )
    arg = {...}
    for k,v in pairs(arg) do
    	log("可变参数：", k,v)
    end
end
funTestUnKnow("aa", "bb", 2323, true);
 
--闭合函数(一个函数写在另外一个函数内)
function funTest1( ... )
	
    local d = 12;
	log("arg select", select("#", ...))

	arg = {...}
    log("arg", arg, #arg)
    for i,v in ipairs(arg) do
    	d = d + v
    end
    --d = d + ...
    function funTest2( ... )
        log("闭合函数", d)
    end
    funTest2()
    return d
end
 
log("aa", funTest1(100, 111))


log("----------------------- 常用操作 -----------------------");
str1 = "I have I";
str2 = " an apple.";
log("字符串相加 用 ..", str1..str2);
str3 = string.gsub(str1, "I", "", 2);
log("替换字符串", str3..str2);

--将字符换成数字tonumber(不转也会自动转)
--将数字换成字符tostring(不转也会自动转)
stringC = "100"
--stringC = tonumber(stringC)
stringC = stringC +20
--stringC = tostring(stringC)
log(stringC)

--取一个字符串的长度使用 #
log("字符串长度：", #tostring(stringC))


---------------------
girl = {money = 200}
function girl.goToMarket(girl ,someMoney)
	girl.money = girl.money - someMoney
end
girl.goToMarket(girl ,100)
print("点号调用"..girl.money)

boy = {money = 200}
function boy:goToMarket(someMoney)
	self.money = self.money - someMoney
end
boy:goToMarket(100)
print("冒号调用"..boy.money)

log("调用类的函数时尽量使用冒号,可以省略一个self的传参,属性使用点号")

