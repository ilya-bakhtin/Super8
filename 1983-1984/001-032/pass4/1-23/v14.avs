LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
#v14 = LSMASHVideoSource(dst_dir + "v14f.mp4")
vf = LSMASHVideoSource(dst_dir + "v14f.mp4")
v14 = ImageSource(file = dst_dir + "png\v14\v14-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v14 = v14.autolevels#(gamma=0.7)

v14 = v14.convertToY.adjustSize

v14 = v14.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v14 = v14.convertBits(8).convertToYV12(interlaced=false)

v14 = v14.deScratch.extractY
v14 = v14.removeDirt

v14 = v14.convertToYV12(interlaced=false)

v14 = v14.UnsharpMask(strength=400, radius=5, threshold=1)
v14 = v14.adjustBorders

va = BlankClip(v14, audio_rate = 48000, channels = 2).killVideo
v14 = v14.audioDub(va)

return v14.Prefetch

