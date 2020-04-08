%Zachary Boulton, ztboulto  and  Griffin Cook, gvcook
%4/8/2020
%Sections: 206 and 209
%Project3: Story Analyzer, 2020 Spring

%MEGACLEAR
clear;
clc;

list={'Jack and the Bean Stalk','Peter Pan','The Snow Queen',...
    'Velveteen Rabbit', 'Peter Rabbit'};
%creates list of stories

fprintf('----------------------------------\n')
fprintf('Welcome to Children Story Analyser\n')
fprintf('----------------------------------\n')
%prints initial greeting

fprintf('Create visualization[1]\n')
%prints how to create visualization

fprintf(' Create story Report[2]\n')
%prints how to create a report

userChoice=input('Select Action:');
%generates user input on choice

if userChoice~=1 || userChoice~=2
    fprintf('Invalid Input. Terminating the Program')
else
    userStory=listdlg('ListString',list, 'SelectionMode','Single');
    %has the user select the story from the list
    
    if userStory==1
        %if the user picked Jack and the Beanstalk, opens it
        storyFID = fopen('jackBeanStalk.txt');
    elseif userStory==2
        %if the user picked Peter Pan, opens it
        storyFID = fopen('peterPan.txt');
    elseif userStory==3
        %if the user picked Snow Queen, opens it
        storyFID = fopen('snowQueen.txt');
    elseif userStory==4
        %if the user picked velveteen rabbit, opens it
        storyFID = fopen('velveteenRabbit.txt');
    elseif userStory==5
        %if the user picked velveteen rabbit, opens it
        storyFID = fopen('peterRabbit.txt');
    end
    
    %Get the title of the story
    storyTitle = list{userStory};
    
    %Scan through the story and add each 'word' to a cell array
    storyWords = textscan(storyFID,'%s','Delimiter',' ');
    storyWords = storyWords{1};
    fclose(storyFID);
   
    stopWordsFID = fopen('stopWords.txt');
    listStopWords = textscan(stopWordsFID,'%s');
    listStopWords = listStopWords{1};
    fclose(stopWordsFID);
    %opens the list of stop words
    
    %initialize all cleaned words call array
    allCleanedWords = {};
    
    %loop through each word
    for i=1:length(storyWords)
        currentWord = storyWords{i};
        %clean the word
        cleanedWord = cleanWord(currentWord);
        
        %If it's not a stop word, add it to the clean word list
        if ~isStopWord(listStopWords,cleanedWord)
            allCleanedWords{end+1} = cleanedWord;
        end
    end
    
    %Get the unique word list and the top ten struct array
    uniqueWords = getUniqueWords(allCleanedWords);
    topTenWordsStruct = getTopTenWords(uniqueWords);
    
    %initialize variables
    topTenWords = {};
    topTenScores = [];
    
    %For each of the top 10, add its word and frequency to the array
    for i = 1:10
        topTenWords{end+1} = topTenWordsStruct(i).word;
        topTenScores(end+1) = topTenWordsStruct(i).frequency;
    end
    
    
    if userChoice==1
        %creates a visualization
        subplot(1,2,1)
        wordcloud({uniqueWords.word},[uniqueWords.frequency]);
        title(storyTitle)
        %creates word cloud
        subplot(1,2,2)
        bar(topTenScores,'FaceColor',[0.8500 0.3250 0.0980])
        set(gca,'XTick',[1:10],'xticklabel',topTenWords)
        xtickangle(90)
        title('Most Frequent Words')
        ylabel('Word Frequncies')
        %creates bar graph
    else
        %generate the report
        generateReport(storyTitle,length(uniqueWords),topTenWordsStruct)
    end
end