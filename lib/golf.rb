public
Golf = self
def hole1 a,b
b.scan(/#{a}/i).length
end
def hole2 a,b
a.chars.map{|c|c!=' '&&b.times{c=c.next[0]};c}.join
end
def hole3 a
d=IO.readlines(a).map{|l|l.split.map(&:to_i)}
s=proc{|b|b.inject:+}
(d.map(&s)+d.transpose.map(&s)).max
end
def hole4 a
{I:1,V:5,X:10,L:50,IV:4,VIII:8,XI:11,LVII:57,XLIX:49}[a.to_sym]
end
def hole5 a
(2..a.length).map{|i|a.chars.each_cons(i).map(&:join)}.flatten.uniq.select{|r|r==r.reverse}
end
def hole6 a
a.split.reduce([]){|m,x|i=x.to_i;m<<(i==0?(a=m.pop(2))&&a[0].send(x,a[1]): i)}[-1]
end
def hole7 a
f=1;n=0;s=0
a.reduce([0,[]]){|m,x|s>0&&(m[0]+=x)&&s-=1
s>1&&(m[0]+=x)&&s-=1
s+=1if f<10&&n%2==1&&m[1][-1]+x==10
x>9&&f<10?(s+=2)&&f+=1:(n+=1)&&(n%2==0)&&f+=1
m[0]+=x;m[1]<<x;m
}[0]
end
def hole8
a=%w(one two three four five six seven eight nine)
a+%w(ten eleven twelve)+%w(thir four fif six seven eigh nine).map{|x|x+'teen'}+%w(twen thir for fif six seven eigh nine).map{|x|x<<'ty';[x]+a.map{|k|x+' '+k}}.flatten<<'one hundred'
end
def hole9 a
(1..a).map{|i|a='';i%3==0&&a<<'fizz';i%5==0&&a<<'buzz';a.length==0?i: a}
end
