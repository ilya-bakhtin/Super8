LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
#v19 = LSMASHVideoSource(dst_dir + "v19f.mp4")
vf = LSMASHVideoSource(dst_dir + "v19f.mp4")
v19 = ImageSource(file = dst_dir + "png\v19\v19-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v19 = v19.autolevels#(gamma=0.7)

v19 = v19.convertToY.adjustSize

v19 = v19.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v19 = v19.convertBits(8).convertToYV12(interlaced=false)

v19 = v19.deScratch.extractY
v19 = v19.removeDirt

v19 = v19.convertToYV12(interlaced=false)

v19 = v19.UnsharpMask(strength=400, radius=5, threshold=1)
v19 = v19.adjustBorders

va = BlankClip(v19, audio_rate = 48000, channels = 2).killVideo
v19 = v19.audioDub(va)

return v19.Prefetch

