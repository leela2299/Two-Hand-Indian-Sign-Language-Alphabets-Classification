function [result] = accurate(x,y)


%----- function to calcuate accuarcy of the classifier ----------------

%++++++++++ @Lakshay Jain, @Leela Surya Teja Mangamuri 2020 +++++++++++++++

count=0;
for i=1:length(x)
    
   if(x(i)==y(i))
       count=count+1;
   end
    
end

result=count*100/length(x);

end

