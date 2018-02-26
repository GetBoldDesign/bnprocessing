import java.util.Map;

class Settings
{
 
  protected JSONArray data;
  protected String configFileName;
  
  Settings()
  {
     this.data = new JSONArray();
     this.configFileName = "bn.json";
  }
 
  public void setConfigFileName(String fileName)
  {
    this.configFileName = fileName;
  }
  
  public String getConfigFileName()
  {
    return this.configFileName;
  }
  
  public JSONArray getData() 
  {
    return this.data;
  }
  
  public void load() 
  {
    JSONArray values;
    values = loadJSONArray(this.configFileName);
    //
    this.data = values;    
  }
  
  public void dump()
  {
    saveJSONArray(this.getData(), this.getConfigFileName());
  }
  
}