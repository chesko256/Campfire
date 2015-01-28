robodoc.exe
pandoc.exe "./output/CampUtil_psc.xml" -f docbook -t markdown_github -o "./output/CampUtil_psc.txt" --base-header-level=3
python githubber.py "CampUtil_psc.txt" "../../../campwiki/CampUtil-API-Reference.md"