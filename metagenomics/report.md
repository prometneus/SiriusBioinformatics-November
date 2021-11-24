# Отчёт по метагеномике.

# Команды

[Список](metagenomics/commands.sh) команд, выполненных на устройстве:

![изображение](https://user-images.githubusercontent.com/86663451/142720477-d195431a-487b-4154-adf1-9f6d4c4dbd79.png)

# Отчёт MultiQC
Имеются 2 paired-end последовательности.

![изображение](https://user-images.githubusercontent.com/86663451/142238482-80f2c57e-b4fe-4eec-b3fb-33ce1035e090.png)

Среднее качество:

![изображение](https://user-images.githubusercontent.com/86663451/142238433-2f74a5cf-46dd-46ba-afc5-ffd924667bc1.png)

Адаптеры удалять не требуется:

![изображение](https://user-images.githubusercontent.com/86663451/142238693-5cd42260-8456-42be-823b-fa2880cae254.png)

Также в последовательностях мало гэпов:

![изображение](https://user-images.githubusercontent.com/86663451/142238942-978fa877-4b8c-42f7-832d-18bb207737cd.png)

Нашлась прикольная штучка в виде расхождения в конце. Возможно, это связано с падением качества.

![изображение](https://user-images.githubusercontent.com/86663451/142599071-436f6344-04e7-40ce-9aa0-d116bb2c76e0.png)

# Metaquast

Далее собираем контиги с помощью metaSPAdes и кидаем их вместе с референсными геномами в metaquast. На выходе получаем такую штуку:

![изображение](https://user-images.githubusercontent.com/86663451/143217220-f84e4d39-8af1-4c16-a981-74970b383a1c.png)

Здесь заметно, что наибольшая часть misassemblies попала в Cryptococcus_neoformans, так что можно смело утверждать, что он собрался хуже всего.

![изображение](https://user-images.githubusercontent.com/86663451/143217627-644a2eb4-75f0-4929-85e3-970fb8c28cd9.png)

График largest_alignment подтверждает, что Cryptococcus оч плохо собрался. Bacillus_subtilis же собрался очень даже недурно.

![изображение](https://user-images.githubusercontent.com/86663451/143217967-1648cfea-bb42-49de-873a-b53c18ceecc1.png)

Pseudomonas_aeruginosa, согласно графику, имеет наибольший количество выровненных с референсом баз, что говорит о хорошей сборке. Про Cryptococcus в третий раз одно и то же писать не хочется, поэтому промолчу.


Рассмотрим отдельно статистику без референсов: 

![изображение](https://user-images.githubusercontent.com/86663451/143218786-0c5de9f2-c604-41b5-b2b1-184a57d834bc.png)

Статистика показывает, что осталось 125 невыровненных контигов из чуть более 12 тысяч всего. Это довольно неплохой результат для таких-то данных. Мне очень нравится уровень сборки Bacillus_subtilis: ему нужен был всего 31 контиг, а N50 получился максимальным. Enterococcus_faecalis тоже хорош.

N50 у Cryptococcus_neoformans, объясни: вставить мем.

Теперь бинним полученные ранее контиги с помощью metabat2 и анализируем биннинги:

![изображение](https://user-images.githubusercontent.com/86663451/143216873-4d990ef0-376f-45f5-88f6-40eaf783ea0e.png)

BUSCO для 1 файла с бинами:

![изображение](https://user-images.githubusercontent.com/86663451/143059638-2e643b87-1c72-43d3-9b47-555cde5b2b4f.png)

BUSCO для 2 файла:

![изображение](https://user-images.githubusercontent.com/86663451/143061850-8f65d653-4c07-460b-b545-5b6e2002f5bb.png)

BUSCO для 3 файла:

![изображение](https://user-images.githubusercontent.com/86663451/143062947-681c6da3-00d1-46d8-9e12-abb949cbc7eb.png)

