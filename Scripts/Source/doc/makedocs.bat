robodoc.exe
pandoc.exe "./output/CampUtil_psc.xml" -f docbook -t markdown_github -o "./output/CampUtil_psc.txt" --base-header-level=3
pandoc.exe "./output/_Camp_PlaceableObjectBase_psc.xml" -f docbook -t markdown_github -o "./output/_Camp_PlaceableObjectBase_psc.txt" --base-header-level=3
pandoc.exe "./output/CampTent_psc.xml" -f docbook -t markdown_github -o "./output/CampTent_psc.txt" --base-header-level=3
pandoc.exe "./output/CampTentEx_psc.xml" -f docbook -t markdown_github -o "./output/CampTentEx_psc.txt" --base-header-level=3
python githubber.py "CampUtil_psc.txt" "../../../campwiki/CampUtil-API-Reference.md"
python githubber.py "CampTent_psc.txt" "../../../campwiki/CampTent-Script.md"
python githubber.py "CampTentEx_psc.txt" "../../../campwiki/CampTentEx-Script.md"
pause