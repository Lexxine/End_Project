package pl.coderslab.edamam;

public class Recipe {
    private String name;
    private String imageUrl;
    private String source;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    public void setSource(String source){
        this.imageUrl = source;
    }
    public String getSource() {
        return source;
    }
}
