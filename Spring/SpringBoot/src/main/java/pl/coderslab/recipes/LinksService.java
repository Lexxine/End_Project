package pl.coderslab.recipes;

import org.springframework.stereotype.Service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class LinksService {
    private String getYoutubeThumbnail(String youtubeUrl) {
        String videoId = extractYoutubeVideoId(youtubeUrl);
        return "https://img.youtube.com/vi/" + videoId + "/0.jpg";
    }

    private String extractYoutubeVideoId(String youtubeUrl) {
        String pattern = "^(?:https?://)?(?:www\\.)?(?:youtube\\.com/watch\\?v=|youtu\\.be/)([\\w-]{11})(?:\\S+)?$";
        Pattern compiledPattern = Pattern.compile(pattern);
        Matcher matcher = compiledPattern.matcher(youtubeUrl);
        if (matcher.matches()) {
            return matcher.group(1);
        } else {
            return "";
        }
    }
}