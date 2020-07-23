class JsonFormatUtil {
  //json格式化显示
  static String formatJson(String jsonStr) {
    List<int> charCodesNew = List<int>();
    //空格数
    int spaceCount = 0;
    //初始空格缩进
    bool isAddInitBlank = false;

    if(jsonStr == null || jsonStr.isEmpty){
      return "{}";
    }

    for (int i = 0; i < jsonStr.length; i++) {

      if (jsonStr.codeUnitAt(i) == "{".codeUnitAt(0)) {
        // "{"初始空格缩进
        if(isAddInitBlank){
          addBlank(spaceCount, charCodesNew);
        }
        charCodesNew.add(jsonStr.codeUnitAt(i));
        //content内容换行
        charCodesNew.add("\n".codeUnitAt(0));
        //缩进增加
        spaceCount += 3;
        addBlank(spaceCount, charCodesNew);
      } else if (jsonStr.codeUnitAt(i) == "[".codeUnitAt(0)) {
        charCodesNew.add(jsonStr.codeUnitAt(i));
        charCodesNew.add("\n".codeUnitAt(0));
        spaceCount += 3;
        isAddInitBlank = true;
      } else if (jsonStr.codeUnitAt(i) == "}".codeUnitAt(0)) {
        // "}"换行
        charCodesNew.add("\n".codeUnitAt(0));
        spaceCount -= 3;
        addBlank(spaceCount, charCodesNew);
        charCodesNew.add(jsonStr.codeUnitAt(i));
        isAddInitBlank = false;

      } else if (jsonStr.codeUnitAt(i) == "]".codeUnitAt(0)) {
        // "]"换行
        charCodesNew.add("\n".codeUnitAt(0));
        spaceCount -= 3;
        addBlank(spaceCount, charCodesNew);
        charCodesNew.add(jsonStr.codeUnitAt(i));
        isAddInitBlank = false;

      } else if (jsonStr.codeUnitAt(i) == ",".codeUnitAt(0)) {
        charCodesNew.add(jsonStr.codeUnitAt(i));
        //换行
        charCodesNew.add("\n".codeUnitAt(0));
        addBlank(spaceCount, charCodesNew);
      } else {
        // content
        charCodesNew.add(jsonStr.codeUnitAt(i));
      }
    }

    String fromCharCodes = String.fromCharCodes(charCodesNew);
    //正则删除所有空行
    String jsonFormat = fromCharCodes.replaceAll(RegExp(r"\n\s*\n"), "\n");
    return jsonFormat;
  }

  //添加缩进空格
  static void addBlank(int spaceCount, List<int> charCodesNew) {
    for (int j = 0; j < spaceCount; j++) {
      charCodesNew.add(" ".codeUnitAt(0));
    }
  }

}
