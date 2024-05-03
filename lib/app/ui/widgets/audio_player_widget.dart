// import 'package:audio_waveforms/audio_waveforms.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:zynabaiexpoders/config/constant/color_constant.dart';

// class AudioPlayerWidget extends StatefulWidget {
//   final String audioUrl;
//   const AudioPlayerWidget({super.key, required this.audioUrl});

//   @override
//   State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
// }

// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   RecorderController controller = RecorderController();

//   Future<void> _initPlayer(String url) async {
//     await _audioPlayer.setUrl(url);
//   }

//   Future<void> _play() async {
//     await _audioPlayer.play();
//   }

//   Future<void> _pause() async {
//     await controller.stop();
//     await _audioPlayer.pause();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: const Icon(
//                   Icons.play_arrow,
//                   color: kBlackColor,
//                 ),
//                 onPressed: () {
//                   _initPlayer(widget.audioUrl);
//                   _play();
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.pause, color: kBlackColor),
//                 onPressed: () {
//                   _pause();
//                 },
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 200,
//             width: MediaQuery.of(context).size.width,
//             child: AudioWaveforms(
//               size: Size(MediaQuery.of(context).size.width, 200.0),
//               recorderController: controller,
//               waveStyle: WaveStyle(
//                 showDurationLabel: true,
//                 spacing: 8.0,
//                 showBottom: false,
//                 extendWaveform: true,
//                 showMiddleLine: false,
//               ),
//             ),
//           ),
//           // SizedBox(
//           //   height: 100,
//           //   width: 200,
//           //   child: AudioWaveforms(
//           //     size: Size(MediaQuery.of(context).size.width, 200.0),
//           //     recorderController: controller,
//           //     enableGesture: true,
//           //     waveStyle: const WaveStyle(
//           //       showDurationLabel: true,
//           //       spacing: 8.0,
//           //       showBottom: false,
//           //       extendWaveform: true,
//           //       showMiddleLine: false,
//           //     ),
//           //   ),
//           // ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
