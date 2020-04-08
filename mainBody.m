%Zachary Boulton, ztboulto  and  Griffin Cook, gvcook
%4/8/2020
%Sections: 206 and 
%Project3: Story Analyzer, 2020 Spring

list={'Jack and The Beanstalk','Peter Pan','Snow Queen', 'Velveteen Rabbit'};
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

userStory=listdlg('ListString',list, 'SelectionMode','Single');
%has the user select the story from the list

if userStory==1
    %if the user picked Jack and the Beanstalk, opens it
    storyFID = fopen('jackBeanStalk.txt');
elseif userStory==2
    %if the user picked Peter Pan, opens it
    storyFID = fopen('peterPan,txt');
elseif userStory==3
    %if the user picked Snow Queen, opens it
<<<<<<< HEAD
    storyFID = fopen('snowQueen.txt');
elseif userStory==4
    %if the user picked velveteen rabbit, opens it
    storyFID = fopen('velveteenRabbit.txt');
end

storyWords = textscan(storyFID,'%s','Delimiter',' ');
storyWords = storyWords{1};
fclose(storyFid);

stopWordsFID = fopen('stopWords.txt');
listStopWords = textscan(stopWordsFID,'%s');
fclose(stopWordsFID);
%opens the list of stop words

   for i=1:length(userStory)
   theWords=isStopWord(listStopWords,userStory);
    if theWords==1
        %need to figure out how to filter it out
   %finds all of the stop words
   end
   end
   for i=1:length(theWords)
       newWords=cleanWord(theWords);
       %cleans all the words
   end
   for i=1:length(newWords)
       uniqueWords=getUniqueWords(newWords);
       %finds all the unique words
   end
   for i=1:length(uniqueWords)
       topTenWords=getTopTenWords(uniqueWords);
       %finds the top 10 words
   end
if userChoice==1
       %creates a visualization
   wordcloud({uniqueWords.word},[uniqueWords.frequency]);
   %creates word cloud
   
   bar(topTenWords,'color',[0.8500 0.3250 0.0980]))
   set(gca,'XTick',[1:10],'xticklabel',topTenWords) 
   title('Most Frequent Words')
   ylabel('Word Frequncies')
   %creates bar graph
   
   
else
    fprintf('Invalid Input. Terminating the Program')
   end
