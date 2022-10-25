LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
#v20 = LSMASHVideoSource(dst_dir + "v20f.mp4")
vf = LSMASHVideoSource(dst_dir + "v20f.mp4")
v20 = ImageSource(file = dst_dir + "png\v20\v20-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v20 = v20.autolevels#(gamma=0.7)

v20 = v20.convertToY.adjustSize

v20 = v20.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v20 = v20.convertBits(8).convertToYV12(interlaced=false)

v20 = v20.deScratch.extractY
v20 = v20.removeDirt

v20 = v20.convertToYV12(interlaced=false)

v20 = v20.UnsharpMask(strength=400, radius=5, threshold=1)
v20 = v20.adjustBorders

va = BlankClip(v20, audio_rate = 48000, channels = 2).killVideo
v20 = v20.audioDub(va)

return v20.Prefetch

