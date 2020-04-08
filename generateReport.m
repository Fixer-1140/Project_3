function generateReport(storyTitle,numUniqueWords, topTenWords)
%Zachary Boulton, ztboulto  and  Griffin Cook, gvcook
%4/8/2020
%Sections: 206 and 209
%Project3: Story Analyzer, 2020 Spring
%
%uses the word data to create a report for specific story
% Input: storyTitle - character array of the title of the story
%        numUniqueWords - integer for the numebr of unique words
%                         in the story being analyzed
%        topTenWords - a 1x10 Structure Array of the most frequent words
% Output: a report stored in a .txt file called storyReport.txt
%

%Create the story report and prepare to write
FID = fopen('storyReport.txt','w');

%Add the lines for the title and the number of unique words
fprintf(FID,'Story Analyzed: %s\n',storyTitle);
fprintf(FID,'Total Unique Words: %.0d\n',numUniqueWords);

%Add the word frequency header
fprintf(FID,'Frequency, Word\n');

%Turn the structure array into a cell array
topWordsCell = {topTenWords.frequency;topTenWords.word};

%Print the cell array to the text file
fprintf(FID,'%.0d, %s\n',topWordsCell{:,:});

end

