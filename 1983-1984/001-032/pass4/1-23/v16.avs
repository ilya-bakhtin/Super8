LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
#v16 = LSMASHVideoSource(dst_dir + "v16f.mp4")
vf = LSMASHVideoSource(dst_dir + "v16f.mp4")
v16 = ImageSource(file = dst_dir + "png\v16\v16-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v16 = v16.autolevels#(gamma=0.7)

v16 = v16.convertToY.adjustSize

v16 = v16.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v16 = v16.convertBits(8).convertToYV12(interlaced=false)

v16 = v16.deScratch.extractY
v16 = v16.removeDirt

v16 = v16.convertToYV12(interlaced=false)

v16 = v16.UnsharpMask(strength=400, radius=5, threshold=1)
v16 = v16.adjustBorders

va = BlankClip(v16, audio_rate = 48000, channels = 2).killVideo
v16 = v16.audioDub(va)

return v16.Prefetch

