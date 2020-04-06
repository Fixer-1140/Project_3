function [newWord] = cleanWord(word)
%Zachary Boulton, ztboulto  and  Griffen Cook, gvcook
%4/8/2020
%Sections: 206 and 
%Project3: Story Analyzer, 2020 Spring
%
%"cleans" up a word for wordcloud
% Input: word is a character array to be cleared up
% Return: newWord is the cleaned up word
%

%Initialize newWord character array
newWord = '';

%Go through each character
for i = 1:length(word)
    %Add all letters to newWord after making them lowercase
    if isletter(word(i))
        newWord = [newWord,lower(word(i))];
    end
end

end

