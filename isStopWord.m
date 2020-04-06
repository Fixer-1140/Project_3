function stopword = isStopWord(stopWords,word)
%Zachary Boulton, ztboulto  and  Griffen Cook, gvcook
%4/8/2020
%Sections: 206 and 
%Project3: Story Analyzer, 2020 Spring
%
%determines if a word is a stopword
% Input: stopwords: is a Cell Array that contains all the workds from
%                   the file stopWords.txt
%             word: is a Character Array
% Return:
%        stopWord: is logical(1)/TRUE if word IS a stopword otherwise it is
%                  logical(0)/FALSE if it is NOT a stopword
%

stopword = ismember(word,stopWords);

end
