LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\..\1983-1984.avs")
#v15 = LSMASHVideoSource(dst_dir + "v15f.mp4")
vf = LSMASHVideoSource(dst_dir + "v15f.mp4")
v15 = ImageSource(file = dst_dir + "png\v15\v15-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v15 = v15.autolevels#(gamma=0.7)

v15 = v15.convertToY.adjustSize

v15 = v15.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v15 = v15.convertBits(8).convertToYV12(interlaced=false)

v15 = v15.deScratch.extractY
v15 = v15.removeDirt

v15 = v15.convertToYV12(interlaced=false)

v15 = v15.UnsharpMask(strength=400, radius=5, threshold=1)
v15 = v15.adjustBorders

va = BlankClip(v15, audio_rate = 48000, channels = 2).killVideo
v15 = v15.audioDub(va)

return v15.Prefetch

