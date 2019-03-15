# twitter_stream_exporter_docker

Unofficial docker image of https://github.com/cosmopetrich/twitter_stream_exporter

## Usage

See https://github.com/cosmopetrich/twitter_stream_exporter.

```bash
docker run --rm -it \
    -e "TWITTER_ACCESS_TOKEN=..." \
    -e "TWITTER_ACCESS_SECRET=..." \
    -e "TWITTER_CONSUMER_KEY=..." \
    -e "TWITTER_CONSUMER_SECRET=..." \
    contribu/twitter_stream_exporter_docker \
    twitter_stream_exporter -twitter.track 'akeyword,anotherkeyword'
```

## LICENSE

The license of this repository itself is CC0.
The license of the original twitter_stream_exporter is MIT - https://github.com/cosmopetrich/twitter_stream_exporter.
