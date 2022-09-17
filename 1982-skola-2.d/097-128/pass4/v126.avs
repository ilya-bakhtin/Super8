LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v126 = LSMASHVideoSource(dst_dir + "v126rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v126f.mp4")
v126 = ImageSource(file = dst_dir + "v126-png\v126-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v126 = v126.convertToY.adjustSize

#v126 = v126.extractY.convertToYV12(interlaced=false)
#v126 = v126.deScratch.extractY

v126 = v126.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v126 = v126.convertBits(8).convertToYV12(interlaced=false)

v126 = v126.deScratch.extractY
v126 = v126.removeDirt
v126 = v126.convertToYV12(interlaced=false)
v126 = v126.UnsharpMask(strength=400, radius=5, threshold=1)
v126 = v126.adjustBorders
#v126 = v126.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v126 = v126.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v126, audio_rate = 48000, channels = 2).killVideo
v126 = v126.audioDub(va)

return v126.Prefetch

