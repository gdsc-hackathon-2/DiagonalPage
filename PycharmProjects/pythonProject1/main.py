import random

person = [chr(a) for a in range (ord('A'), ord('Z')+1)] #팀을 구성할 사람 들의 이름을 range(  ) 안에 넣어주세
members_num=int(input('각 팀당 인원:'))

for a in range(len(person)):
    temps = []
    while len(temps) < members_num:
        temp=random.choice(person)

        if temp not in temps:
            temps.append(temp)
            person.remove(temp)
    print(f'{a+1}조: {temps}')

if len(person) !=0:
    print('\n')
    print(f'남은 인원:{person}')